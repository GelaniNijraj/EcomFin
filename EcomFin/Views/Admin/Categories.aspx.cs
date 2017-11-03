using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class Categories : System.Web.UI.Page {
        public List<Category> categories = new List<Category>();
        protected void Page_Load(object sender, EventArgs e) {
            Controllers.Categories catcon = new Controllers.Categories();
            categories = catcon.GetAll().ToList();
            Page.DataBind();
        }
    }
}