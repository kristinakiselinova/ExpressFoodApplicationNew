using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Domain;

namespace ExpressFood.Repository.Interface
{

    public interface IRepository<T> where T : BaseEntity

    {
        IEnumerable<T> GetAll();
        IEnumerable<FoodItem> GetAllFoodItems();
        FoodItem GetFoodItem(Guid? id);
        T Get(Guid? id);
        T Insert(T entity);
        List<T> InsertMany(List<T> entities);
        T Update(T entity);
        T Delete(T entity);

    }
}
