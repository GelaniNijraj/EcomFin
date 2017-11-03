using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace EcomFin.Controllers {
    public class Attributes {
        ecomEntities db = new ecomEntities();
        public Attributes() {
            
        }

        public void CreateName(string n) {
            var name = new AttributeName();
            name.Name = n;
            db.AttributeNames.Add(name);
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
            Debug.WriteLine("Length is " + t.Count);
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

        public static void UpdateValue(AttributeValue val) {
            Debug.WriteLine("Type is >> " + val.Id + " >>" + val.Value + "<<");

            /*
            Debug.WriteLine("Doing update attribute " + Id + " to " + Value);
            try {
                var val = db.AttributeValues.Where(r => r.Id == Id).First();
                val.Value = Value;
                db.SaveChanges();
            }catch(Exception e) {
                Debug.WriteLine("Couldn't update attribute " + Id + " to " + Value);
            }*/
        }
    }
}