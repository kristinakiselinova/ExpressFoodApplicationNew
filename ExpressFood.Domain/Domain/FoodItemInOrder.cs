﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExpressFood.Domain.Domain
{
    public class FoodItemInOrder : BaseEntity
    {
        public Guid? DeliveryOrderId { get; set; }
        public DeliveryOrder? DeliveryOrder { get; set; }
        public Guid? FoodItemId { get; set; }
        public FoodItem FoodItem { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }

    }
}
