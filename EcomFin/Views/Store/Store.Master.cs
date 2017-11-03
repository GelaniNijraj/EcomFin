using EcomFin.Controllers;
using System;
using System.Collections.Generic;
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

        protected void Page_Load(object sender, EventArgs e) {
            cfg = new ConfigurationHelper();
            categories = new Categories();
            products = new Products();
            uh = new UserHelper(Session);
            ch = new CartHelper(Session["cart"]);
        }
    }
}