using EcomFin.Controllers;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Store {
    public partial class Index : System.Web.UI.Page {
        public ConfigurationHelper cfg;
        public Categories categories;
        public Products products;
        public CartHelper ch;

        protected void Page_Load(object sender, EventArgs e) {
            cfg = new ConfigurationHelper();
            categories = new Categories();
            products = new Products();
            ch = new CartHelper(Session["cart"]);
            if (Page.RouteData.Values["category"] == null) {
                RepeaterProducts.DataSource = ObjectDataSourceProducts;
            } else {
                RepeaterProducts.DataSource = ObjectDataSourceProductsCategory;
            }
            if (!IsPostBack) {
                Page.DataBind();
            }else {

            }
        }

        public string GetImageURL(object o) {
            var p = (HashSet<ProductImage>) o;
            if(p.Count > 0) {
                return "/Images/Products/" + p.First().URL;
            }else {
                return "/Images/placeholder.png";
            }
        }

        public void AddToCart(object o, RepeaterCommandEventArgs e) {
            Debug.WriteLine("At least here");
            ch.AddProduct(Int32.Parse(e.CommandArgument.ToString()));
            Session["cart"] = ch.Cart;
        }
    }
}