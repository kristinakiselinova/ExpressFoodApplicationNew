using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Domain;

namespace ExpressFood.Service.Interface
{
    public interface IPartnerTeamService
    {
        public IEnumerable<Restaurant> GetPartnerRestaurants();
    }
}
