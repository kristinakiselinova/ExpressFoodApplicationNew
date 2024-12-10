using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Domain;

namespace ExpressFood.Service.Interface
{
    public interface IFoodItemService
    {
        public List<FoodItem> GetFoodItems();
        public FoodItem GetFoodItemById(Guid? id);
        public FoodItem CreateNewFoodItem(FoodItem foodItem);
        public FoodItem UpdateFoodItem(FoodItem foodItem);
        public FoodItem DeleteFoodItem(Guid id);

    }
}
