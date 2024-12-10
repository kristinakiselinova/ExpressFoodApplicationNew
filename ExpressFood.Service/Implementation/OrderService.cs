using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Domain;
using ExpressFood.Repository.Interface;
using ExpressFood.Service.Interface;

namespace ExpressFood.Service.Implementation
{

    public class OrderService : IOrderService
    {
       private readonly IDeliveryOrderRepository _orderRepository;

        public OrderService(IDeliveryOrderRepository orderRepository)
        {
            _orderRepository = orderRepository;
        }
        
        public List<DeliveryOrder> getAllOrders()
        {
            return _orderRepository.GetAllOrders();
        }

        public DeliveryOrder GetDetailsForOrder(BaseEntity id)
        {
           return _orderRepository.GetDetailsForOrder(id);
        }
    }
}
