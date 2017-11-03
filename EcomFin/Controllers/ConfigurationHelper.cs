using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace EcomFin.Controllers {
    public class ConfigurationHelper {
        ecomEntities db;

        public string this[string key] {
            get {
                var row = db.Configurations.Where(c => c.Key == key).FirstOrDefault();
                if (row == null)
                    return "";
                else
                    return row.Value;
            }

            set {
                var row = db.Configurations.Where(c => c.Key == key).FirstOrDefault();
                if(row == null) {
                    Configuration c = new Configuration();
                    c.Key = key;
                    c.Value = value;
                    db.Configurations.Add(c);
                    db.SaveChanges();
                }else {
                    row.Value = value;
                    db.SaveChanges();
                }
            }
        }

        public ConfigurationHelper() {
            db = new ecomEntities();
        }
    }
}