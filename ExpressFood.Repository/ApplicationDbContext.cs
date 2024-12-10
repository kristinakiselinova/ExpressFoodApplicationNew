using ExpressFood.Domain.Domain;
using ExpressFood.Domain.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace ExpressFood.Repository
{
    public class ApplicationDbContext : IdentityDbContext<Customer>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Restaurant> Restaurants { get; set; }
        public virtual DbSet<FoodItem> FoodItems { get; set; }
        public virtual DbSet<DeliveryOrder> DeliveryOrders { get; set; }
        public virtual DbSet<FoodItemInOrder> FoodItemInOrders { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
    }
}
