using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using ExpressFood.Domain.Domain;
using Microsoft.AspNetCore.Identity;

namespace ExpressFood.Domain.Identity
{
    public class Customer : IdentityUser
    {
        public string Name { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }

      
        public  ICollection<DeliveryOrder>? Orders { get; set; }
    }
}
