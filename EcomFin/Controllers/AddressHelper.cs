using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace EcomFin.Controllers {
    public class AddressHelper {
        private ecomEntities db = new ecomEntities();

        public List<Address> GetAll(int id) {
            return db.Addresses.Where(r => r.Customer == id).ToList();
        }

        public void Delete(Address address) {
            db.Addresses.Remove(db.Addresses.Where(r => r.Id == address.Id).First());
            db.SaveChanges();
        }

        public void Update(Address address) {
            var a = db.Addresses.Where(r => r.Id == address.Id).First();
            a.LineOne = address.LineOne;
            a.Street = address.Street;
            a.City = address.City;
            a.State = address.State;
            a.Country = address.Country;
            a.ZIP = address.ZIP;
            db.SaveChanges();
        }
    }
}