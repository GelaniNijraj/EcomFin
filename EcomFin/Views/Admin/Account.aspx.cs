using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class Account : System.Web.UI.Page {
        public EcomFin.Admin admin;

        protected void Page_Load(object sender, EventArgs e) {
            admin = (EcomFin.Admin) Session["admin"];
            Page.DataBind();
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e) {
            
        }
    }
}