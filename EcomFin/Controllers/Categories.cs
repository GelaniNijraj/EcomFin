using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EcomFin.Controllers {
    public class Categories {
        ecomEntities db = new ecomEntities();
        public List<Category> GetAll() {
            return db.Categories.ToList();
        }
    }
}