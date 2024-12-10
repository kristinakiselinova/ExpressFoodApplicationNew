using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Identity;
using ExpressFood.Repository.Interface;
using Microsoft.EntityFrameworkCore;

namespace ExpressFood.Repository.Implementation
{
    public class CustomerRepository : ICustomerRepository
    {
        private readonly ApplicationDbContext context;
        private DbSet<Customer> entities;
        string errorMessage = string.Empty;

        public CustomerRepository(ApplicationDbContext context)
        {
            this.context = context;
            entities = context.Set<Customer>();
        }
        public IEnumerable<Customer> GetAll()
        {
            return entities.AsEnumerable();
        }

        public Customer Get(string id)
        {
            var strGuid = id.ToString();
            var result = entities
                .Include(z => z.Orders)  // Eagerly load Orders collection from Customer
                .ThenInclude(order => order.FoodItemsInOrder)  // Eagerly load FoodItemsInOrder for each DeliveryOrder
                .FirstOrDefault(z => z.Id.ToString() == strGuid);  // Find the customer by Id (strGuid)

            return result;
        }
        public void Insert(Customer entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException("entity");
            }
            entities.Add(entity);
            context.SaveChanges();
        }

        public void Update(Customer entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException("entity");
            }
            entities.Update(entity);
            context.SaveChanges();
        }

        public void Delete(Customer entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException("entity");
            }
            entities.Remove(entity);
            context.SaveChanges();
        }
    }

}
