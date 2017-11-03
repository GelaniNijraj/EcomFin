using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class ProductsEdit : System.Web.UI.Page {
        public Product product;
        public ecomEntities db = new ecomEntities();
        protected void Page_Load(object sender, EventArgs e) {
            if (Page.RouteData.Values["id"] != null) {
                int id = Int32.Parse(Page.RouteData.Values["id"].ToString());
                product = db.Products.Where(r => r.Id == id).First();
            } else {
                product = db.Products.First();
            }
            Page.DataBind();
        }
    }
}