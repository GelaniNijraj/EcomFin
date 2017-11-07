using EcomFin.Controllers;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class AttributesEdit : System.Web.UI.Page {
        public AttributesHelper attrs = new AttributesHelper();
        public AttributeName attribute;
        public ecomEntities db = new ecomEntities();
        protected void Page_Load(object sender, EventArgs e) {
            var id = Page.RouteData.Values["id"];
            if(id != null) {
                int i = Int32.Parse(id.ToString());
                attribute = db.AttributeNames.Where(r => r.Id == i).First();
            } else {
                Response.Redirect("/admin/attributes");
            }
        }

        protected void ButtonAddValue_Click(object sender, EventArgs e) {
            attrs.AddValue(Int32.Parse(Page.RouteData.Values["id"].ToString()), TextBoxValue.Text);
            TextBoxValue.Text = "";
            GridViewValues.DataBind();
        }
        
        protected void ButtonSave_Click(object sender, EventArgs e) {

        }
    }
}