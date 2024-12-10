using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExpressFood.Domain.DTO
{
    public class AddToOrderDTO
    {
        public Guid SelectedFoodItemId { get; set; }
        public string? SelectedFoodItemName { get; set; }
        public int Quantity { get; set; }

    }
}
