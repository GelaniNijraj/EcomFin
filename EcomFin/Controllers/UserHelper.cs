using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace EcomFin.Controllers {
    public class UserHelper {
        public ecomEntities db = new ecomEntities();
        public Customer Customer;

        public UserHelper(HttpSessionState session) {
            if(session["user"] != null)
                Customer = (Customer) session["user"];
        }

        public int GetId() {
            return Customer.Id;
        }

        public bool IsLoggedIn(HttpSessionState session) {
            return session["user"] != null;
        }

        public Customer ValidateCustomer(string email, string password) {
            try {
                return db.Customers.Where(r => r.Email == email && r.Password == password).First();
            } catch {
                return null;
            }
        }

        public void Save() {
            db.SaveChanges();
        }
    }
}