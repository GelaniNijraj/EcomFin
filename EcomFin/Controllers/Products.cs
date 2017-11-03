using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcomFin.Controllers {
    public class Products {
        public ecomEntities db = new ecomEntities();

        public List<Product> GetAll() {
            return db.Products.ToList();
        }

        public List<Product> GetAllInCategory(int c) {
            return db.Products.Where(r => r.Category == c).ToList() ;
        }
    }
}