using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Domain;
using ExpressFood.Repository.Interface;
using ExpressFood.Service.Interface;

namespace ExpressFood.Service.Implementation
{


    public class RestaurantService : IRestaurantService
    {
        public readonly IRepository<Restaurant> Repository;

        public RestaurantService(IRepository<Restaurant> repository)
        {
            Repository = repository;
        }

        public Restaurant CreateRestaurant(Restaurant restaurant)
        {
            return Repository.Insert(restaurant);
        }

        public Restaurant DeleteRestaurant(Guid id)
        {
            var product_to_delete = this.GetRestaurantById(id);
            return Repository.Delete(product_to_delete);
        }

        public IEnumerable<Restaurant> GetAllRestaurants()
        {
            return Repository.GetAll().ToList();
            
        }

        public Restaurant GetRestaurantById(Guid? id)
        {
            return Repository.Get(id);
        }

        public Restaurant UpdateRestaurant(Restaurant restaurant)
        {
            return Repository.Update(restaurant);
        }
        public Restaurant GetRestaurantDetails(Guid? id)
        {
            var restaurant = Repository.Get(id);
            return restaurant;
        }
    }
}
