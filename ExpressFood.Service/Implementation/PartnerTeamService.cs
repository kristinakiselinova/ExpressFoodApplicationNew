using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using ExpressFood.Domain.Domain;
using ExpressFood.Service.Interface;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace ExpressFood.Service.Implementation
{
    public class PartnerTeamService : IPartnerTeamService
    {
        private readonly string _connectionString;

        public PartnerTeamService(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("PartnersTeamConnection") ?? throw new System.ArgumentNullException(nameof(configuration));
        }

        public IEnumerable<Restaurant> GetPartnerRestaurants()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var restaurants = connection.Query("SELECT * FROM Restaurants");

                List<Restaurant> localRestaurants = new List<Restaurant>();

                foreach (var restaurant in restaurants)
                {
                    var rest = new Restaurant
                    {
                        Id = restaurant.Id,
                        Name = restaurant.RestaurantName,
                        Address = restaurant.RestaurantAddress,
                        RestaurantImage = restaurant.RestaurantImage
                    };
                    localRestaurants.Add(rest);
                }
                return localRestaurants;
            }
        }
    }
}
