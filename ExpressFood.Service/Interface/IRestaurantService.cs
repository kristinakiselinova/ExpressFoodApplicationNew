using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Domain;

namespace ExpressFood.Service.Interface
{
    public interface IRestaurantService
    {
        public IEnumerable<Restaurant> GetAllRestaurants();
        public Restaurant GetRestaurantById(Guid? id);
        public Restaurant CreateRestaurant(Restaurant restaurant);
        public Restaurant UpdateRestaurant(Restaurant restaurant);
        public Restaurant DeleteRestaurant(Guid id);
        public Restaurant GetRestaurantDetails(Guid? id);
    }
}
