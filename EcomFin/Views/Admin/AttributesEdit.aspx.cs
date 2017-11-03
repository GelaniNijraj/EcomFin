using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class AttributesEdit : System.Web.UI.Page {
        public Controllers.Attributes attrs = new Controllers.Attributes();

        protected void Page_Load(object sender, EventArgs e) {
            /*var id = Page.RouteData.Values["id"];
            if(id != null) {
                GridViewValues.DataSource = attrs.GetValues(Int32.Parse(id.ToString()));
                GridViewValues.DataBind();
            }
            */
            Page.DataBind();
        }

        protected void GridViewValues_SelectedIndexChanged(object sender, EventArgs e) {

        }

        protected void ButtonAddValue_Click(object sender, EventArgs e) {
            //attrs.AddValue(Int32.Parse(Page.RouteData.Values["id"].ToString()), TextBoxValue.Text);
            //TextBoxValue.Text = "";
            GridViewValues.DataBind();
        }

        public List<AttributeValue> GetValues() {
            var id = Page.RouteData.Values["id"];
            if(id != null) {
                return attrs.GetValues(Int32.Parse(id.ToString()));
            }else {
                return new List<AttributeValue>();
            }
        }
       
        protected void ButtonSave_Click(object sender, EventArgs e) {

        }

        public void GridViewValues_RowUpdating(object sender, GridViewUpdateEventArgs e) {
            Debug.WriteLine("Updating " + e.RowIndex);
        }
    }
}