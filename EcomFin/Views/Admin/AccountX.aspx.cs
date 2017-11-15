using EcomFin.Controllers.Validators;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class AccountX : System.Web.UI.Page {
        public EcomFin.Admin admin;

        public ecomEntities db = new EcomFin.ecomEntities();

        protected void Page_Load(object sender, EventArgs e) {
            admin = db.Admins.Where(r => r.Username == User.Identity.Name).First();
            TextBoxUsername.Attributes["value"] = admin.Username;
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e) {
            Debug.WriteLine("username is " + User.Identity.Name);
            var con = new EcomFin.ecomEntities();
            var a = con.Admins.Where(r => r.Username == User.Identity.Name).First();
            a.Username = TextBoxUsername.Text;
            a.Password = TextBoxPassword.Text;
            var validator = new AdminValidator();
            var result = validator.Validate(a);
            if (result.IsValid) {
                con.SaveChanges();
            } else {
                LabelMessage.Text = result.Errors.First().ErrorMessage;
            }
        }
    }
}