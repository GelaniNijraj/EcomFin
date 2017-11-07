using EcomFin.Controllers;
using EcomFin.Controllers.Validators;
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
        public ecomEntities db = new ecomEntities();
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
                if (Request.QueryString["redirect"] != null)
                    Response.Redirect("/" + Request.QueryString["redirect"]);
                else
                    Response.Redirect("/");
            }
        }

        protected void ButtonRegister_Click(object sender, EventArgs e) {
            var c = new Customer();
            var validator = new CustomerValidator();
            c.Name = TextBoxName.Text;
            c.Email = TextBoxUsername.Text;
            c.Password = TextBoxPassword.Text;
            var results = validator.Validate(c);
            if (!results.IsValid) {
                LabelRegisterMessage.Text = results.Errors.First().ErrorMessage;
            } else {
                db.Customers.Add(c);
                db.SaveChanges();
                Session["user"] = c;
                if (Request.QueryString["redirect"] != null)
                    Response.Redirect("/" + Request.QueryString["redirect"]);
                else
                    Response.Redirect("/");
            }
        }
    }
}