using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace EcomFin.Controllers {
    public class Products {
        public ecomEntities db = new ecomEntities();

        public List<Product> GetAll() {
            return db.Products.OrderByDescending(r => r.Id).ToList();
        }

        public List<Product> GetAllInCategory(int c) {
            return db.Products.Where(r => r.Category == c).ToList() ;
        }

        public List<Product> GetAllSearch(string search, string category, string minprice, string maxprice) {
            int c = Int32.Parse(category);
            int min, max;
            try {
                min = Int32.Parse(minprice);
                max = Int32.Parse(maxprice);
            } catch {
                min = max = -1;
            }

            min = min == -1 ? 0 : min;
            max = max == -1 ? int.MaxValue : max;
            if(search == null) 
                search = "";

            search = search == null ? "" : search;
            
            Debug.WriteLine("min = " + min + ", max = " + max);

            if (c == 0) {
                return db.Products
                    .OrderByDescending(r => r.Id)
                    .Where(r => (r.Name.Contains(search) || r.Description.Contains(search)) && r.Price >= min && r.Price <= max)
                    .ToList();
            } else {
                return db.Products
                    .OrderByDescending(r => r.Id)
                    .Where(r => r.Category == c && (r.Name.Contains(search) || r.Description.Contains(search)) && r.Price >= min && r.Price <= max)
                    .ToList();
            }
        }
    }
}