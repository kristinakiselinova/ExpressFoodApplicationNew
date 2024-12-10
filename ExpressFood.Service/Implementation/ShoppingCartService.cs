using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Domain;
using ExpressFood.Domain.DTO;
using ExpressFood.Repository.Interface;
using ExpressFood.Service.Interface;
using Microsoft.IdentityModel.Tokens;

namespace ExpressFood.Service.Implementation
{
    public class ShoppingCartService : IShoppingCartService
    {
        private readonly IRepository<DeliveryOrder> _deliveryOrderRepository;
        private readonly IRepository<FoodItemInOrder> _foodItemInOrderRepository;
        private readonly IRepository<FoodItem> _foodItemRepository;
        private readonly ICustomerRepository _customerRepository;

        public ShoppingCartService(IRepository<DeliveryOrder> deliveryOrderRepository, IRepository<FoodItemInOrder> foodItemInOrderRepository, IRepository<FoodItem> foodItemRepository, ICustomerRepository customerRepository)
        {
            _deliveryOrderRepository = deliveryOrderRepository;
            _foodItemInOrderRepository = foodItemInOrderRepository;
            _foodItemRepository = foodItemRepository;
            _customerRepository = customerRepository;
        }

        public bool AddToShoppingCartConfirmed(string userId, FoodItemInOrder order)
        {
            var loggedInUser = _customerRepository.Get(userId);

            var userOrder = loggedInUser.Orders.FirstOrDefault(z => z.Status == "Pending");

            if (userOrder == null)
            {
                userOrder = new DeliveryOrder
                {
                    CustomerId = userId,
                    OrderDate = DateTime.Now,
                    Price = 0m,
                    Status = "Pending", 
                    FoodItemsInOrder = new List<FoodItemInOrder>() 
                };
                loggedInUser.Orders.Add(userOrder);
            }

            if (order.FoodItem == null && order.FoodItemId.HasValue)
            {
                var foodItem = _foodItemRepository.Get(order.FoodItemId.Value); 

                if (foodItem != null)
                {
                    order.FoodItem = foodItem;
                    order.FoodItem.Name = foodItem.Name;
                }
            }

            if (order.FoodItem != null)
            {
                order.Price = order.FoodItem.Price * order.Quantity;
            }
            else
            {
                return false; 
            }

            userOrder.FoodItemsInOrder.Add(order);

            userOrder.Price = userOrder.FoodItemsInOrder.Sum(f => f.Price); 

            _deliveryOrderRepository.Update(userOrder);
            return true;
        }



        public bool deleteItemFromShoppingCart(string userId, Guid? productId)
        {
            if (productId != null)
            {
                var loggedInUser = _customerRepository.Get(userId);

                var userShoppingCart = loggedInUser.Orders.FirstOrDefault(z => z.Status == "Pending"); ;
                var product = userShoppingCart.FoodItemsInOrder.Where(x => x.FoodItemId == productId).FirstOrDefault();

                userShoppingCart.FoodItemsInOrder.Remove(product);

                _deliveryOrderRepository.Update(userShoppingCart);
                return true;
            }
            return false;

        }

        public OrderDTO getShoppingCartInfo(string userId)
        {
            var loggedInUser = _customerRepository.Get(userId);
            var userOrder = loggedInUser.Orders.FirstOrDefault(z => z.Status == "Pending");

            if (userOrder != null)
            {
                var foodItemsInOrder = userOrder.FoodItemsInOrder?.ToList() ?? new List<FoodItemInOrder>();

                var totalPrice = 0.0;

                var foodItems = foodItemsInOrder.Select(f =>
                {
                    var foodItem = _foodItemRepository.Get(f.FoodItemId); 

                    if (foodItem == null)
                    {
                        return null;
                    }

                    totalPrice += (double) foodItem.Price * f.Quantity;

                    return new FoodItemInOrder
                    {
                        FoodItemId = f.FoodItemId,
                        Quantity = f.Quantity,
                        Price = foodItem.Price,  
                        FoodItem = foodItem      
                    };
                })
                .Where(f => f != null)  
                .ToList();

                OrderDTO order = new OrderDTO
                {
                    ItemsInOrder = foodItems,
                    TotalAmount = totalPrice
                };

                return order;
            }
            else
            {
                return new OrderDTO
                {
                    ItemsInOrder = new List<FoodItemInOrder>(),
                    TotalAmount = 0
                };
            }

        }

        public bool makeOrder(string userId)
        {
            if (userId != null)
            {
                var loggedInUser = _customerRepository.Get(userId);  
                var userShoppingCart = loggedInUser.Orders;  

                DeliveryOrder order = new DeliveryOrder
                {
                    Id = Guid.NewGuid(),
                    CustomerId = userId,
                    Customer = loggedInUser,
                    OrderDate = DateTime.Now,
                    Status = "Created",
                    Price = 0 
                };

                _deliveryOrderRepository.Insert(order);

                List<FoodItemInOrder> foodItemInOrders = new List<FoodItemInOrder>();

                var lista = userShoppingCart.FirstOrDefault(z => z.CustomerId == userId)?.FoodItemsInOrder
                            .Select(x => new FoodItemInOrder
                            {
                                Id = Guid.NewGuid(),
                                FoodItemId = x.FoodItem?.Id,
                                FoodItem = x.FoodItem,
                                DeliveryOrderId = order.Id,
                                DeliveryOrder = order,
                                Quantity = x.Quantity,
                                Price = x.Price
                            })
                            .Where(x => x.FoodItem != null) 
                            .ToList();

                if (lista != null)
                {
                    foodItemInOrders.AddRange(lista);
                    foreach (var product in foodItemInOrders)
                    {
                        _foodItemInOrderRepository.Insert(product); 
                    }

                    var cart = userShoppingCart.FirstOrDefault(z => z.CustomerId == userId);
                    if (cart != null)
                    {
                        cart.FoodItemsInOrder.Clear();  

                        foreach (var item in cart.FoodItemsInOrder)
                        {
                            _foodItemInOrderRepository.Delete(item); 
                        }

                        _customerRepository.Update(loggedInUser); 
                    }
                    return true;  
                }
            }
            return false;  
        }
    }
}
