using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class Login : System.Web.UI.Page {
        ecomEntities db = new ecomEntities();
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void ButtonLogin_Click(object sender, EventArgs e) {
            string username = TextBoxUsername.Text,
                   password = TextBoxPassword.Text;
            var user = db.Admins.Where(r => r.Username == username && r.Password == password).FirstOrDefault();
            if (user != null) {
                string roles = "admin";
                FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(
                  1,
                  username,  //user id
                  DateTime.Now,
                  DateTime.Now.AddMinutes(20),  // expiry
                  false,  //do not remember
                  roles,
                  "/");
                HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName,
                                                   FormsAuthentication.Encrypt(authTicket));
                Response.Cookies.Add(cookie);
                Response.Redirect("/admin/products");
            }
        }
    }
}