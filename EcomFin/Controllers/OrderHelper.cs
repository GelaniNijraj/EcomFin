using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace EcomFin.Controllers {
    public class OrderHelper {
        private ecomEntities db = new ecomEntities();

        public void PlaceHolder(Cart cart, Customer customer, int address) {
            var order = new Order();
            order.Customer = customer.Id;
            order.PlacedOn = DateTime.Now;
            order.StatusCode = "PENDING";
            order.DeliverTo = address;
            db.Orders.Add(order);
            db.SaveChanges();
            foreach(var i in cart.Content) {
                var item = new OrderItem();
                item.Order = order.Id;
                item.Product = i.Key;
                item.Quantity = i.Value;
                item.Price = db.Products.Where(r => r.Id == i.Key).First().Price;
                db.OrderItems.Add(item);
            }
            db.SaveChanges();
        }

        public List<Order> GetAll() {
            return db.Orders.ToList();
        }

        public List<Order> GetAll(int id) {
            return db.Orders.Where(r => r.Customer == id).ToList();
        }
    }
}