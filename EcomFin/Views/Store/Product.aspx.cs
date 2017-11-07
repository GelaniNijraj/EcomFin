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

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod]
        public static AjaxControlToolkit.Slide[] GetAllImages() {
            AjaxControlToolkit.Slide[] slides = new AjaxControlToolkit.Slide[sp.ProductImages.Count];
            Debug.WriteLine("Getting em images");
            //Debug.WriteLine("gotcha " + sp.ProductImages.Count);
            for (int i = 0; i < sp.ProductImages.Count; i++) {
                slides[i] = new AjaxControlToolkit.Slide("/Images/Products/" + sp.ProductImages.ToList()[i], sp.Name, sp.Name);
            }
            return slides;
        }
    }
}