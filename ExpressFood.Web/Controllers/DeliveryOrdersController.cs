using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ExpressFood.Domain.Domain;
using ExpressFood.Repository;
using ExpressFood.Service.Interface;
using ExpressFood.Domain.Identity;
using System.Security.Claims;
using Stripe;
using Microsoft.AspNetCore.Authorization;


namespace ExpressFood.Web.Controllers
{
    [Authorize]
    public class DeliveryOrdersController : Controller
    {
        private readonly IShoppingCartService _shoppingCartService;

        public DeliveryOrdersController(IShoppingCartService shoppingCartService)
        {
            _shoppingCartService = shoppingCartService;
        }

        public IActionResult Index()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var dto = _shoppingCartService.getShoppingCartInfo(userId);
            return View(dto);
        }

        public IActionResult Order()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var result = _shoppingCartService.makeOrder(userId);
            return RedirectToAction("Index", "DeliveryOrders");
        }

        public IActionResult DeleteFoodItem(Guid id)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            _shoppingCartService.deleteItemFromShoppingCart(userId, id);

            return RedirectToAction("Index");

        }

        public IActionResult SuccessPayment()
        {
            return View();
        }

        public IActionResult PayOrder(string stripeEmail, string stripeToken)
        {
            StripeConfiguration.ApiKey = "sk_test_51QU6DgKtpnAeHOuJOV62LjMYB0is7Wv1lUbfCzqIgpwYZxZed1X9CkrWDgnwblLQMW82nD45XK3Db1eF5LLMfYlP003a56DjL3";
            var customerService = new CustomerService();
            var chargeService = new ChargeService();
            string userId = User.FindFirstValue(ClaimTypes.NameIdentifier);

            var order = this._shoppingCartService.getShoppingCartInfo(userId);

            var customer = customerService.Create(new CustomerCreateOptions
            {
                Email = stripeEmail,
                Source = stripeToken
            });

            var charge = chargeService.Create(new ChargeCreateOptions
            {
                Amount = (Convert.ToInt32(order.TotalAmount) * 100),
                Description = "ExpressFood Application Payment",
                Currency = "usd",
                Customer = customer.Id
            });

            if (charge.Status == "succeeded")
            {
                this.Order();
                return RedirectToAction("SuccessPayment");

            }
            else
            {
                return RedirectToAction("NotsuccessPayment");
            }
        }

        public IActionResult MakeOrder()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var dto = _shoppingCartService.getShoppingCartInfo(userId);

            var result = _shoppingCartService.makeOrder(userId);

            if (result)
            {
                return View("OrderSuccess", dto);
            }

            return RedirectToAction("Index", "ShoppingCarts");
        }
    }
}
