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
            var master = (Store) Master;
            ObjectDataSourceSearch.SelectParameters.Clear();
            ObjectDataSourceSearch.SelectParameters.Add(
                "search",
                 Session["search"] == null ? "" : Session["search"].ToString()
            );
            ObjectDataSourceSearch.SelectParameters.Add(
                "minprice",
                 Session["minprice"] == null ? "-1" : Session["minprice"].ToString()
            );
            ObjectDataSourceSearch.SelectParameters.Add(
                "maxprice",
                 Session["maxprice"] == null ? "-1" : Session["maxprice"].ToString()
            );
            ObjectDataSourceSearch.SelectParameters.Add(
                "category", 
                Page.RouteData.Values["category"] == null ? "0" : Page.RouteData.Values["category"].ToString()
            );
            RepeaterProducts.DataSource = ObjectDataSourceSearch;
            /*
            if (Page.RouteData.Values["category"] == null) {
                RepeaterProducts.DataSource = ObjectDataSourceProducts;
            } else {
                RepeaterProducts.DataSource = ObjectDataSourceProductsCategory;
            }*/
            if (!IsPostBack) {
                RepeaterProducts.DataBind();
                Page.DataBind();
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