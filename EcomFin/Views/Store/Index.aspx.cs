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
            if (!Request.Url.AbsolutePath.Contains("search"))
                ClearSessions();
            if (!IsPostBack) {
                RepeaterProducts.DataBind();
                Page.DataBind();
            }
        }

        private void ClearSessions() {
            Session["search"] = null;
            Session["minprice"] = null;
            Session["maxprice"] = null;
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

        protected void ObjectDataSourceSearch_Selected(object sender, ObjectDataSourceStatusEventArgs e) {
            var data = (List<EcomFin.Product>)e.ReturnValue;

            Debug.WriteLine("count is " + data.Count);
            if (data.Count == 0)
                LabelNoProducts.Text = "No products found";
        }

        public string ShortenName(string name, int len) {
            return name.Length > len ? name.Substring(0, len) + "..." : name;
        }
    }
}