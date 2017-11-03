using EcomFin.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class Settings : System.Web.UI.Page {
        public ConfigurationHelper cfg = new ConfigurationHelper();
        protected void Page_Load(object sender, EventArgs e) {
            Page.DataBind();
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e) {
            var c = new ConfigurationHelper();
            c["SiteTitle"] = TextBoxStoreTitle.Text;
            c["SiteDescription"] = TextBoxDescription.Text;
            c["HeaderText"] = TextBoxHeader.Text;
            c["FooterText"] = TextBoxFooter.Text;
            LabelMessage.Text = "Settings updated successfully...";
        }
    }
}