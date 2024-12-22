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

namespace ExpressFood.Web.Controllers
{
    public class RestaurantsController : Controller
    {
        /* private readonly ApplicationDbContext _context;

         public RestaurantsController(ApplicationDbContext context)
         {
             _context = context;
         }

         // GET: Restaurants
         public async Task<IActionResult> Index()
         {
             return View(await _context.Restaurants.ToListAsync());
         }

         // GET: Restaurants/Details/5
         public async Task<IActionResult> Details(Guid? id)
         {
             if (id == null)
             {
                 return NotFound();
             }

             var restaurant = await _context.Restaurants
                 .FirstOrDefaultAsync(m => m.Id == id);
             if (restaurant == null)
             {
                 return NotFound();
             }

             return View(restaurant);
         }

         // GET: Restaurants/Create
         public IActionResult Create()
         {
             return View();
         }

         // POST: Restaurants/Create
         // To protect from overposting attacks, enable the specific properties you want to bind to.
         // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
         [HttpPost]
         [ValidateAntiForgeryToken]
         public async Task<IActionResult> Create([Bind("Name,Address,ContactNumber,OpeningHours,RestaurantImage,Rating,Id")] Restaurant restaurant)
         {
             if (ModelState.IsValid)
             {
                 restaurant.Id = Guid.NewGuid();
                 _context.Add(restaurant);
                 await _context.SaveChangesAsync();
                 return RedirectToAction(nameof(Index));
             }
             return View(restaurant);
         }

         // GET: Restaurants/Edit/5
         public async Task<IActionResult> Edit(Guid? id)
         {
             if (id == null)
             {
                 return NotFound();
             }

             var restaurant = await _context.Restaurants.FindAsync(id);
             if (restaurant == null)
             {
                 return NotFound();
             }
             return View(restaurant);
         }

         // POST: Restaurants/Edit/5
         // To protect from overposting attacks, enable the specific properties you want to bind to.
         // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
         [HttpPost]
         [ValidateAntiForgeryToken]
         public async Task<IActionResult> Edit(Guid id, [Bind("Name,Address,ContactNumber,OpeningHours,RestaurantImage,Rating,Id")] Restaurant restaurant)
         {
             if (id != restaurant.Id)
             {
                 return NotFound();
             }

             if (ModelState.IsValid)
             {
                 try
                 {
                     _context.Update(restaurant);
                     await _context.SaveChangesAsync();
                 }
                 catch (DbUpdateConcurrencyException)
                 {
                     if (!RestaurantExists(restaurant.Id))
                     {
                         return NotFound();
                     }
                     else
                     {
                         throw;
                     }
                 }
                 return RedirectToAction(nameof(Index));
             }
             return View(restaurant);
         }

         // GET: Restaurants/Delete/5
         public async Task<IActionResult> Delete(Guid? id)
         {
             if (id == null)
             {
                 return NotFound();
             }

             var restaurant = await _context.Restaurants
                 .FirstOrDefaultAsync(m => m.Id == id);
             if (restaurant == null)
             {
                 return NotFound();
             }

             return View(restaurant);
         }

         // POST: Restaurants/Delete/5
         [HttpPost, ActionName("Delete")]
         [ValidateAntiForgeryToken]
         public async Task<IActionResult> DeleteConfirmed(Guid id)
         {
             var restaurant = await _context.Restaurants.FindAsync(id);
             if (restaurant != null)
             {
                 _context.Restaurants.Remove(restaurant);
             }

             await _context.SaveChangesAsync();
             return RedirectToAction(nameof(Index));
         }

         private bool RestaurantExists(Guid id)
         {
             return _context.Restaurants.Any(e => e.Id == id);
         }*/

        private readonly IFoodItemService _foodItemService;
        private readonly IShoppingCartService _orderService;
        private readonly IRestaurantService _restaurantService;

        public RestaurantsController(IFoodItemService foodItemService, IShoppingCartService orderService, IRestaurantService restaurantService)
        {
            _foodItemService = foodItemService;
            _orderService = orderService;
            _restaurantService = restaurantService;
        }

        public IActionResult Index()
        {
            return View(_restaurantService.GetAllRestaurants());
        }

        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var restaurant = _restaurantService.GetRestaurantById(id);
            if (restaurant == null)
            {
                return NotFound();
            }
            return View(restaurant);
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
        public IActionResult Create([Bind("Name, Address, ContactNumber, OpeningHours, RestaurantImage, Rating")] Restaurant restaurant)
        {


            if (ModelState.IsValid)
            {
                restaurant.Id = Guid.NewGuid();
                _restaurantService.CreateRestaurant(restaurant);
                return RedirectToAction(nameof(Index));
            }
            return View(restaurant);

        }

        [Authorize(Roles = "admin")]
        public IActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var restaurant = _restaurantService.GetRestaurantById(id);
            if (restaurant == null)
            {
                return NotFound();
            }
            return View(restaurant);
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "admin")]
        public IActionResult Edit(Guid id, [Bind("Id,Name, Address, ContactNumber, OpeningHours, RestaurantImage, Rating")] Restaurant restaurant)
        {
            if (id != restaurant.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                _restaurantService.UpdateRestaurant(restaurant);

                return RedirectToAction(nameof(Index));
            }

            return View(restaurant);
        }

        [Authorize(Roles = "admin")]
        public IActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var restaurant = _restaurantService.GetRestaurantById(id);
            if (restaurant == null)
            {
                return NotFound();
            }

            return View(restaurant);
        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "admin")]
        public IActionResult DeleteConfirmed(Guid id)
        {
            _restaurantService.DeleteRestaurant(id);
            return RedirectToAction(nameof(Index));
        }
    }
}
