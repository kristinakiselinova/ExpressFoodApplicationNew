using ExpressFood.Service.Interface;
using Microsoft.AspNetCore.Mvc;

namespace ExpressFood.Web.Controllers
{
    public class PartnersRestaurantController : Controller
    {
        private readonly IPartnerTeamService _partnerTeamService;

        public PartnersRestaurantController(IPartnerTeamService partnerTeamService)
        {
            _partnerTeamService = partnerTeamService;
        }

        public IActionResult Index()
        {
            var restautants = _partnerTeamService.GetPartnerRestaurants();
            return View(restautants);
        }
    }
}
