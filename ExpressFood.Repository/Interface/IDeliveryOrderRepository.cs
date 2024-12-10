using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Domain;

namespace ExpressFood.Repository.Interface
{
    public interface IDeliveryOrderRepository
    {
        List<DeliveryOrder> GetAllOrders();
        DeliveryOrder GetDetailsForOrder(BaseEntity id);
    }
}
