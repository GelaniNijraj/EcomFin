using AjaxControlToolkit;
using EcomFin.Controllers;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Store {
    public partial class Store : System.Web.UI.MasterPage {
        public ConfigurationHelper cfg;
        public Categories categories;
        public Products products;
        public CartHelper ch;
        public UserHelper uh;
        public ecomEntities db = new ecomEntities();
        public string Search { get; set; }
        public TextBox SearchBox {
            get {
                return TextBoxSearch;
            }
        }

        protected void Page_Load(object sender, EventArgs e) {
            cfg = new ConfigurationHelper();
            categories = new Categories();
            products = new Products();
            uh = new UserHelper(Session);
            ch = new CartHelper(Session["cart"]);
            TextBoxSearch.Attributes["value"] = Session["search"] == null ? "" : Session["search"].ToString();
            try {
                SliderPrice.Minimum = db.Products.Min(p => (int)p.Price);
                SliderPrice.Maximum = db.Products.Max(p => (int)p.Price);
            } catch {
                SliderPrice.Minimum = 0;
                SliderPrice.Maximum = 100;
            }
            TextBoxPrice1.Attributes["value"] = Session["minprice"] == null ? SliderPrice.Minimum + "" : Session["minprice"].ToString();
            TextBoxPrice2.Attributes["value"] = Session["maxprice"] == null ? SliderPrice.Maximum + "" : Session["maxprice"].ToString();
        }
        
        protected void ButtonSearch_Click(object sender, EventArgs e) {
            Session["search"] = TextBoxSearch.Text;
            Response.Redirect("/search");
        }

        protected void ButtonApplyPrice_Click(object sender, EventArgs e) {
            Debug.WriteLine("Applying prices");
            Session["minprice"] = TextBoxPrice1.Text;
            Session["maxprice"] = TextBoxPrice2.Text;
            Response.Redirect("/search");
        }
    }
}