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
        /* private readonly ApplicationDbContext _context;

         public DeliveryOrdersController(ApplicationDbContext context)
         {
             _context = context;
         }

         // GET: DeliveryOrders
         public async Task<IActionResult> Index()
         {
             var applicationDbContext = _context.DeliveryOrders.Include(d => d.Customer);
             return View(await applicationDbContext.ToListAsync());
         }

         // GET: DeliveryOrders/Details/5
         public async Task<IActionResult> Details(Guid? id)
         {
             if (id == null)
             {
                 return NotFound();
             }

             var deliveryOrder = await _context.DeliveryOrders
                 .Include(d => d.Customer)
                 .FirstOrDefaultAsync(m => m.Id == id);
             if (deliveryOrder == null)
             {
                 return NotFound();
             }

             return View(deliveryOrder);
         }

         // GET: DeliveryOrders/Create
         public IActionResult Create()
         {
             ViewData["CustomerId"] = new SelectList(_context.Customers, "Id", "Id");
             return View();
         }

         // POST: DeliveryOrders/Create
         // To protect from overposting attacks, enable the specific properties you want to bind to.
         // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
         [HttpPost]
         [ValidateAntiForgeryToken]
         public async Task<IActionResult> Create([Bind("OrderDate,Price,Status,CustomerId,Id")] DeliveryOrder deliveryOrder)
         {
             if (ModelState.IsValid)
             {
                 deliveryOrder.Id = Guid.NewGuid();
                 _context.Add(deliveryOrder);
                 await _context.SaveChangesAsync();
                 return RedirectToAction(nameof(Index));
             }
             ViewData["CustomerId"] = new SelectList(_context.Customers, "Id", "Id", deliveryOrder.CustomerId);
             return View(deliveryOrder);
         }

         // GET: DeliveryOrders/Edit/5
         public async Task<IActionResult> Edit(Guid? id)
         {
             if (id == null)
             {
                 return NotFound();
             }

             var deliveryOrder = await _context.DeliveryOrders.FindAsync(id);
             if (deliveryOrder == null)
             {
                 return NotFound();
             }
             ViewData["CustomerId"] = new SelectList(_context.Customers, "Id", "Id", deliveryOrder.CustomerId);
             return View(deliveryOrder);
         }

         // POST: DeliveryOrders/Edit/5
         // To protect from overposting attacks, enable the specific properties you want to bind to.
         // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
         [HttpPost]
         [ValidateAntiForgeryToken]
         public async Task<IActionResult> Edit(Guid id, [Bind("OrderDate,Price,Status,CustomerId,Id")] DeliveryOrder deliveryOrder)
         {
             if (id != deliveryOrder.Id)
             {
                 return NotFound();
             }

             if (ModelState.IsValid)
             {
                 try
                 {
                     _context.Update(deliveryOrder);
                     await _context.SaveChangesAsync();
                 }
                 catch (DbUpdateConcurrencyException)
                 {
                     if (!DeliveryOrderExists(deliveryOrder.Id))
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
             ViewData["CustomerId"] = new SelectList(_context.Customers, "Id", "Id", deliveryOrder.CustomerId);
             return View(deliveryOrder);
         }

         // GET: DeliveryOrders/Delete/5
         public async Task<IActionResult> Delete(Guid? id)
         {
             if (id == null)
             {
                 return NotFound();
             }

             var deliveryOrder = await _context.DeliveryOrders
                 .Include(d => d.Customer)
                 .FirstOrDefaultAsync(m => m.Id == id);
             if (deliveryOrder == null)
             {
                 return NotFound();
             }

             return View(deliveryOrder);
         }

         // POST: DeliveryOrders/Delete/5
         [HttpPost, ActionName("Delete")]
         [ValidateAntiForgeryToken]
         public async Task<IActionResult> DeleteConfirmed(Guid id)
         {
             var deliveryOrder = await _context.DeliveryOrders.FindAsync(id);
             if (deliveryOrder != null)
             {
                 _context.DeliveryOrders.Remove(deliveryOrder);
             }

             await _context.SaveChangesAsync();
             return RedirectToAction(nameof(Index));
         }

         private bool DeliveryOrderExists(Guid id)
         {
             return _context.DeliveryOrders.Any(e => e.Id == id);
         }
 */
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
