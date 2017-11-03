using EcomFin.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Store {
    public partial class Register : System.Web.UI.Page {
        public UserHelper uh;

        protected void Page_Load(object sender, EventArgs e) {
            uh = new UserHelper(Session); 
            if (uh.IsLoggedIn(Session))
                Response.Redirect("/");
        }

        protected void ButtonLogin_Click(object sender, EventArgs e) {
            string email = TextBoxLoginUsername.Text, password = TextBoxLoginPassword.Text;
            var user = uh.ValidateCustomer(email, password);
            if (user == null)
                LabelLoginMessage.Text = "Incorect credentials...";
            else {
                Session["user"] = user;
                Response.Redirect("/");
            }
        }
    }
}