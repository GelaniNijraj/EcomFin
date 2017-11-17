using AjaxControlToolkit;
using EcomFin.Controllers;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Store {
    public partial class Product : System.Web.UI.Page {
        public EcomFin.Product product;
        public ecomEntities db = new ecomEntities();
        private static EcomFin.Product sp;

        protected void Page_Load(object sender, EventArgs e) {
            Debug.WriteLine("loading");
            try {
                if (Page.RouteData.Values["id"] != null) {
                    var id = Int32.Parse(Page.RouteData.Values["id"].ToString());
                    product = db.Products.Where(r => r.Id == id).First();
                } else {
                    Response.Redirect("/");
                }
            } catch {
                Response.Redirect("/");
            }
        }

        public string GetImageURL() {
            Debug.WriteLine(product.ProductImages.Count > 0 ? "~/Images/Products/" + product.ProductImages.First().URL : "~");
            return product.ProductImages.Count > 0 ? "~/Images/Products/" + product.ProductImages.First().URL : "~";
        }
        
        protected void ButtonAddToCart_Click(object sender, EventArgs e) {
            int qty = 1;
            try {
                qty = Int32.Parse(TextBoxQuantity.Text);
            } catch {
                qty = 1;
            }

            var ch = new CartHelper(Session["cart"]);
            ch.AddProduct(product.Id, qty);
            Session["cart"] = ch.Cart;
        }
    }
}