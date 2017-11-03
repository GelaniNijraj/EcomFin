using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class Products : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            var p = new Product();
        }
    }
}