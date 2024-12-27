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
using Microsoft.AspNetCore.Authorization;
using ExpressFood.Service.Implementation;
using System.Security.Claims;
using ExpressFood.Domain.DTO;

namespace ExpressFood.Web.Controllers
{
    public class FoodItemsController : Controller
    {
        private readonly IFoodItemService _foodItemService;
        private readonly IShoppingCartService _orderService;
        private readonly IRestaurantService _restaurantService;

        public FoodItemsController(IFoodItemService foodItemService, IShoppingCartService orderService, IRestaurantService restaurantService)
        {
            _foodItemService = foodItemService;
            _orderService = orderService;
            _restaurantService = restaurantService;
        }

        public IActionResult Index()
        {
            return View(_foodItemService.GetFoodItems());
        }

        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var foodItem = _foodItemService.GetFoodItemById(id);
            if (foodItem == null)
            {
                return NotFound();
            }
            return View(foodItem);
        }

        //GET
        [Authorize(Roles = "admin")]
        public IActionResult Create()
        {
            var restaurants = _restaurantService.GetAllRestaurants();

            ViewData["RestaurantId"] = new SelectList(restaurants, "Id", "Name");
            return View();
        }

        //POST
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "admin")]
        public IActionResult Create([Bind("Id, Name, Description, Price, FoodItemImage,RestaurantId, Restaurant")] FoodItem item)
        {


            if (ModelState.IsValid)
            {
                item.Id = Guid.NewGuid();
                var restaurant = _restaurantService.GetRestaurantById(item.RestaurantId);

                item.Restaurant = restaurant;

                _foodItemService.CreateNewFoodItem(item);
                return RedirectToAction(nameof(Index));
            }
            return View(item);

        }

        [Authorize(Roles = "admin")]
        public IActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = _foodItemService.GetFoodItemById(id);
            if (product == null)
            {
                return NotFound();
            }
            var restaurants = _restaurantService.GetAllRestaurants();

            ViewData["RestaurantId"] = new SelectList(restaurants, "Id", "Name");
            return View(product);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "admin")]
        public ActionResult Edit(Guid id, [Bind("Id, Name, Description, Price, FoodItemImage,RestaurantId, Restaurant")] FoodItem item)
        {
            if (id != item.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                _foodItemService.UpdateFoodItem(item);
                var restaurant = _restaurantService.GetRestaurantById(item.RestaurantId);
                item.Restaurant = restaurant;

                return RedirectToAction(nameof(Index));
            }

            return View(item);
        }

        [Authorize(Roles = "admin")]
        public IActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = _foodItemService.GetFoodItemById(id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "admin")]
        public IActionResult DeleteConfirmed(Guid id)
        {
            _foodItemService.DeleteFoodItem(id);
            return RedirectToAction(nameof(Index));
        }

        public IActionResult AddToCart(Guid id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var foodItem = _foodItemService.GetFoodItemById(id);
            FoodItemInOrder ps = new FoodItemInOrder();
            if (foodItem != null)
            {
                ps.FoodItemId = foodItem.Id;
                ps.FoodItem = foodItem;
            }
            return View(ps);
        }

        [HttpPost]
        public IActionResult AddToCartConfirmed(FoodItemInOrder foodItem)
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            _orderService.AddToShoppingCartConfirmed(userId, foodItem);
            return View("Index", _foodItemService.GetFoodItems());
        }
    }
}
