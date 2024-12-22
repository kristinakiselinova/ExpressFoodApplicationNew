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

        /* private readonly ApplicationDbContext _context;

         public FoodItemsController(ApplicationDbContext context)
         {
             _context = context;
         }

         // GET: FoodItems
         public async Task<IActionResult> Index()
         {
             var applicationDbContext = _context.FoodItems.Include(f => f.Restaurant);
             return View(await applicationDbContext.ToListAsync());
         }

         // GET: FoodItems/Details/5
         public async Task<IActionResult> Details(Guid? id)
         {
             if (id == null)
             {
                 return NotFound();
             }

             var foodItem = await _context.FoodItems
                 .Include(f => f.Restaurant)
                 .FirstOrDefaultAsync(m => m.Id == id);
             if (foodItem == null)
             {
                 return NotFound();
             }

             return View(foodItem);
         }

         // GET: FoodItems/Create
         public IActionResult Create()
         {
             ViewData["RestaurantId"] = new SelectList(_context.Restaurants, "Id", "Name");
             return View();
         }

         // POST: FoodItems/Create
         // To protect from overposting attacks, enable the specific properties you want to bind to.
         // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
         [HttpPost]
         [ValidateAntiForgeryToken]
         public async Task<IActionResult> Create([Bind("Name,Description,Price,FoodItemImage,RestaurantId,Id")] FoodItem foodItem)
         {
             if (ModelState.IsValid)
             {
                 foodItem.Id = Guid.NewGuid();
                 _context.Add(foodItem);
                 await _context.SaveChangesAsync();
                 return RedirectToAction(nameof(Index));
             }
             ViewData["RestaurantId"] = new SelectList(_context.Restaurants, "Id", "Name", foodItem.RestaurantId);
             return View(foodItem);
         }

         // GET: FoodItems/Edit/5
         public async Task<IActionResult> Edit(Guid? id)
         {
             if (id == null)
             {
                 return NotFound();
             }

             var foodItem = await _context.FoodItems.FindAsync(id);
             if (foodItem == null)
             {
                 return NotFound();
             }
             ViewData["RestaurantId"] = new SelectList(_context.Restaurants, "Id", "Name", foodItem.RestaurantId);
             return View(foodItem);
         }

         // POST: FoodItems/Edit/5
         // To protect from overposting attacks, enable the specific properties you want to bind to.
         // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
         [HttpPost]
         [ValidateAntiForgeryToken]
         public async Task<IActionResult> Edit(Guid id, [Bind("Name,Description,Price,FoodItemImage,RestaurantId,Id")] FoodItem foodItem)
         {
             if (id != foodItem.Id)
             {
                 return NotFound();
             }

             if (ModelState.IsValid)
             {
                 try
                 {
                     _context.Update(foodItem);
                     await _context.SaveChangesAsync();
                 }
                 catch (DbUpdateConcurrencyException)
                 {
                     if (!FoodItemExists(foodItem.Id))
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
             ViewData["RestaurantId"] = new SelectList(_context.Restaurants, "Id", "Name", foodItem.RestaurantId);
             return View(foodItem);
         }

         // GET: FoodItems/Delete/5
         public async Task<IActionResult> Delete(Guid? id)
         {
             if (id == null)
             {
                 return NotFound();
             }

             var foodItem = await _context.FoodItems
                 .Include(f => f.Restaurant)
                 .FirstOrDefaultAsync(m => m.Id == id);
             if (foodItem == null)
             {
                 return NotFound();
             }

             return View(foodItem);
         }

         // POST: FoodItems/Delete/5
         [HttpPost, ActionName("Delete")]
         [ValidateAntiForgeryToken]
         public async Task<IActionResult> DeleteConfirmed(Guid id)
         {
             var foodItem = await _context.FoodItems.FindAsync(id);
             if (foodItem != null)
             {
                 _context.FoodItems.Remove(foodItem);
             }

             await _context.SaveChangesAsync();
             return RedirectToAction(nameof(Index));
         }

         private bool FoodItemExists(Guid id)
         {
             return _context.FoodItems.Any(e => e.Id == id);
         }*/
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

                // Associate the Restaurant with the FoodItem
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
