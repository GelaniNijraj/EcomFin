using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace EcomFin.Controllers {
    public class AttributesHelper {
        ecomEntities db = new ecomEntities();
        public AttributesHelper() {
            
        }

        public void CreateName(string n) {
            var name = new AttributeName();
            name.Name = n;
            db.AttributeNames.Add(name);
            db.SaveChanges();
        }

        public void Update(AttributeValue attr) {
            var val = db.AttributeValues.Where(r => r.Id == attr.Id).First();
            val.Value = attr.Value;
            db.SaveChanges();
        }
        
        public List<AttributeName> GetNames() {
            return db.AttributeNames.ToList();
        }

        public void AddValue(int nameId, string v) {
            var value = new AttributeValue();
            value.Attribute = nameId;
            value.Value = v;
            db.AttributeValues.Add(value);
            db.SaveChanges();
        }

        public List<AttributeValue> GetValues(int id) {
            var t = db.AttributeValues.Where(r => r.Attribute == id).ToList();
            return t;
        }

        public void DeleteValue(int id) {
            try {
                db.AttributeValues.Remove(db.AttributeValues.Where(r => r.Id == id).FirstOrDefault());
                db.SaveChanges();
            }catch {
                Debug.WriteLine("Couldn't find attribute with id " + id);
            }
        }
    }
}