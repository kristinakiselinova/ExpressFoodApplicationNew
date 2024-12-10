using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Domain;
using ExpressFood.Repository.Interface;
using Microsoft.EntityFrameworkCore;

namespace ExpressFood.Repository.Implementation
{

    public class DeliveryOrderRepository : IDeliveryOrderRepository
    {
        private readonly ApplicationDbContext _context;
        private DbSet<DeliveryOrder> entities;

        public DeliveryOrderRepository(ApplicationDbContext context)
        {
            _context = context;
            entities = _context.Set<DeliveryOrder>();
        }

        public List<DeliveryOrder> GetAllOrders()
        {
            return entities
                .Include(z => z.FoodItemsInOrder)
                .ThenInclude(fio => fio.FoodItem)
                .Include(z => z.Customer)
                .ToList();
        }

        public DeliveryOrder GetDetailsForOrder(BaseEntity id)
        {
            return entities
                .Include(z => z.FoodItemsInOrder)
                .ThenInclude(fio => fio.FoodItem)
                .Include(z => z.Customer)
                .SingleOrDefaultAsync(z => z.Id == id.Id).Result;

        }
    }
}
