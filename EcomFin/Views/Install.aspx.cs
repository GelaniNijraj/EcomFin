using EcomFin.Controllers;
using EcomFin.Controllers.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views {
    public partial class Install : System.Web.UI.Page {
        public ecomEntities db = new ecomEntities();
        protected void Page_Load(object sender, EventArgs e) {
            if (db.Admins.ToList().Count > 0)
                Response.Redirect("/");
        }

        protected void WizardInstall_FinishButtonClick(object sender, WizardNavigationEventArgs e) {
            var _db = new ecomEntities();
            var admin = new EcomFin.Admin();
            admin.Username = TextBoxUsername.Text;
            admin.Password = TextBoxPassword.Text;
            _db.Admins.Add(admin);
            _db.SaveChanges();
            var ch = new ConfigurationHelper();
            ch["SiteTitle"] = TextBoxName.Text;
            ch["HeaderText"] = TextBoxHeading.Text;
            ch["FooterText"] = TextBoxFooter.Text;
            Response.Redirect("/admin");
        }
    }
}