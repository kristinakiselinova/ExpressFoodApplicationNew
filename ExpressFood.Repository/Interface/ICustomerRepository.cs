using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpressFood.Domain.Identity;

namespace ExpressFood.Repository.Interface
{
    public interface ICustomerRepository
    {

        IEnumerable<Customer> GetAll();
        Customer Get(string id);
        void Insert(Customer entity);
        void Update(Customer entity);
        void Delete(Customer entity);

    }
}
