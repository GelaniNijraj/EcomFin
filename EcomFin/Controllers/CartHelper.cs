using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace EcomFin.Controllers {
    [Serializable]
    public class Cart {
        public Dictionary<int, int> Content { get; set; }
    }

    public class CartHelper {
        public Cart Cart { get; set; }

        public CartHelper(object c) {
            if (c == null) {
                Cart = new Cart();
                Cart.Content = new Dictionary<int, int>();
            } else {
                Cart = (Cart)c;
            }
        }

        public int ItemCount() {
            int c = 0;
            foreach (var i in Cart.Content.Keys)
                c += Cart.Content[i];
            return c;
        }

        public void RemoveProduct(int p) {
            Cart.Content.Remove(p);
        }

        public void Clear() {
            Cart.Content = new Dictionary<int, int>();
        }

        public Dictionary<int, int> GetProducts() {
            return Cart.Content;
        }

        public int ParticularItemCount(int id) {
            if (Cart.Content.ContainsKey(id))
                return Cart.Content[id];
            else
                return 0;
        }

        public void AddProduct(int p) {
            if (Cart.Content.ContainsKey(p))
                Cart.Content[p]++;
            else
                Cart.Content[p] = 1;
            Debug.WriteLine("Adding " + p + " " + Cart.Content[p]);
        }

        public void AddProduct(int p, int qty) {
            if (Cart.Content.ContainsKey(p))
                Cart.Content[p] += qty;
            else
                Cart.Content[p] = 1;
            Debug.WriteLine("Adding " + p + " " + Cart.Content[p]);
        }
    }
}