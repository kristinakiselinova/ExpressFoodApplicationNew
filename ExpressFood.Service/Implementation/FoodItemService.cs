using ExpressFood.Domain.Domain;
using ExpressFood.Repository.Interface;
using ExpressFood.Service.Interface;

namespace ExpressFood.Service.Implementation
{
    public class FoodItemService : IFoodItemService
    {
        private readonly IRepository<FoodItem> _foodItemRepository;
        private readonly ICustomerRepository _customerRepository;

        public FoodItemService(IRepository<FoodItem> foodItemRepository, ICustomerRepository customerRepository)
        {
            _foodItemRepository = foodItemRepository;
            _customerRepository = customerRepository;
        }

        public FoodItem CreateNewFoodItem(FoodItem foodItem)
        {
            return _foodItemRepository.Insert(foodItem);
        }

        public FoodItem DeleteFoodItem(Guid id)
        {
            var product_to_delete = this.GetFoodItemById(id);
            return _foodItemRepository.Delete(product_to_delete);
        }

        public FoodItem GetFoodItemById(Guid? id)
        {
            return _foodItemRepository.GetFoodItem(id);
        }

        public List<FoodItem> GetFoodItems()

        {
            return _foodItemRepository.GetAllFoodItems().ToList();
        }

        public FoodItem UpdateFoodItem(FoodItem product)
        {
            return _foodItemRepository.Update(product);
        }

    }
}
