using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExpressFood.Domain.Domain
{
    public class FoodItem : BaseEntity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public string FoodItemImage { get; set; }
        public Guid? RestaurantId { get; set; }
        public virtual Restaurant? Restaurant { get; set; }
        public ICollection<FoodItemInOrder>? FoodItemInOrders { get; set; }
    }
}
