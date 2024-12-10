using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Domain;

namespace ExpressFood.Domain.DTO
{
    public class OrderDTO
    {
        public List<FoodItemInOrder> ItemsInOrder { get; set; }
        public double? TotalAmount { get; set; }

    }
}
