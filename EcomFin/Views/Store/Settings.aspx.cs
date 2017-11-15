using EcomFin.Controllers;
using EcomFin.Controllers.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Store {
    public partial class Settings : System.Web.UI.Page {
        public UserHelper uh;
        public ecomEntities db = new ecomEntities();
        protected void Page_Load(object sender, EventArgs e) {
            uh = new UserHelper(Session);
            if (!uh.IsLoggedIn(Session)) {
                Response.Redirect("/");
            } else {
                if (ObjectDataSourceAddress.SelectParameters.Count == 0)
                    ObjectDataSourceAddress.SelectParameters.Add(new Parameter("id", System.Data.DbType.Int32, uh.GetId() + ""));
                if (ObjectDataSourceOrders.SelectParameters.Count == 0)
                    ObjectDataSourceOrders.SelectParameters.Add(new Parameter("id", System.Data.DbType.Int32, uh.GetId() + ""));
            }
            TextBoxEmail.Attributes["value"] = uh.Customer.Email;
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e) {
            var c = new Customer();
            c.Email = TextBoxEmail.Text;
            c.Password = TextBoxPassword.Text == "" ? uh.Customer.Password : TextBoxPassword.Text;
            var validator = new CustomerValidator();
            var result = validator.Validate(c);
            if (result.IsValid) {
                uh.Customer.Email = c.Email;
                uh.Customer.Password = c.Password;
                uh.Save();
            } else {
                LabelUpdateMessage.Text = result.Errors.First().ErrorMessage;
            }
        }
    }
}