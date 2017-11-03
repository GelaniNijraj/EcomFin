using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Store {
    public partial class Product : System.Web.UI.Page {
        public EcomFin.Product product;
        public ecomEntities db = new ecomEntities();

        protected void Page_Load(object sender, EventArgs e) {
            try {
                if (Page.RouteData.Values["id"] != null) {
                    var id = Int32.Parse(Page.RouteData.Values["id"].ToString());
                    product = db.Products.Where(r => r.Id == id).First();
                }else {
                    product = db.Products.First();
                }
            } catch {
                Response.Redirect("/");
            }
            Page.DataBind();
        }
    }
}