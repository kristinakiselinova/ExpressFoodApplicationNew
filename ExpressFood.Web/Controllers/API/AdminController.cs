using ExpressFood.Domain.Domain;
using ExpressFood.Repository.Interface;
using ExpressFood.Service.Interface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace ExpressFood.Web.Controllers.API
{
    [Route("api/[controller]")]
    [ApiController]
    public class AdminController : ControllerBase
    {
        private readonly IRepository<FoodItem> _foodItemRepository;
        private readonly IOrderService _orderService;

        public AdminController(IRepository<FoodItem> foodItemRepository, IOrderService orderService)
        {
            _foodItemRepository = foodItemRepository;
            _orderService = orderService;
        }

        [HttpGet("[action]")]
        public List<DeliveryOrder> GetAllOrders()
        {
            return this._orderService.getAllOrders();
        }

        [HttpPost("[action]")]
        public DeliveryOrder GetDetails(BaseEntity id)
        {
            return this._orderService.GetDetailsForOrder(id);
        }


        [HttpPost("[action]")]
        public bool ImportFoodItems(List<FoodItem> model)
        {
            bool status = true;

            foreach (var item in model)
            {
                var existingItem = _foodItemRepository.Get(item.Id);


                if (existingItem == null)
                {
                    var foodItem = new FoodItem
                    {
                        Name = item.Name,
                        Description = item.Description,
                        Price = item.Price,
                        FoodItemImage = item.FoodItemImage,
                        RestaurantId = item.RestaurantId
                    };

                    var result = _foodItemRepository.Insert(foodItem);
                    status = status && result != null;
                }
                else
                {
                    continue;
                }
            }
            return status;
        }
    }
}
