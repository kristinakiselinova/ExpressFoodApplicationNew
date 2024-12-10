﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using ExpressFood.Domain.Identity;

namespace ExpressFood.Domain.Domain
{
    public class DeliveryOrder : BaseEntity
    {
        public DateTime OrderDate { get; set; }
        public decimal Price { get; set; }
        public string Status { get; set; }
        public string? CustomerId { get; set; }
        public Customer? Customer { get; set; }
      
        public ICollection<FoodItemInOrder>? FoodItemsInOrder { get; set; }
    }
}
