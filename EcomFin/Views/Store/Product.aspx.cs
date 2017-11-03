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

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod()]
        public AjaxControlToolkit.Slide[] GetImages() {
            /*
            AjaxControlToolkit.Slide[] slides = new AjaxControlToolkit.Slide[product.ProductImages.Count];
            for(int i = 0; i < product.ProductImages.Count; i++) {
                slides[i] = new AjaxControlToolkit.Slide("/Images/Products/" + product.ProductImages.ToList()[i], product.Name, product.Name);
            }
            */
            AjaxControlToolkit.Slide[] slides = new AjaxControlToolkit.Slide[2];
            slides[0] = new AjaxControlToolkit.Slide("/Images/placeholder.png", "", "");
            slides[1] = new AjaxControlToolkit.Slide("/Images/placeholder.png", "", "");
            return slides;
        }
    }
}