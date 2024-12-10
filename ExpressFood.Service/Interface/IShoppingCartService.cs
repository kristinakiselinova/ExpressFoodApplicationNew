using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Domain;
using ExpressFood.Domain.DTO;

namespace ExpressFood.Service.Interface
{
    public interface IShoppingCartService
    {
       
        OrderDTO getShoppingCartInfo(string userId);
        bool deleteItemFromShoppingCart(string userId, Guid? Id);
        bool makeOrder(string userId);
        bool  AddToShoppingCartConfirmed(string userId, FoodItemInOrder order);

    }
}
