using EcomFin.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Store {
    public partial class Settings : System.Web.UI.Page {
        public UserHelper uh;
        protected void Page_Load(object sender, EventArgs e) {
            uh = new UserHelper(Session);
            if (!uh.IsLoggedIn(Session)) {
                Response.Redirect("/");
            } else {
                if(ObjectDataSourceAddress.SelectParameters.Count == 0)
                    ObjectDataSourceAddress.SelectParameters.Add(new Parameter("id", System.Data.DbType.Int32, uh.GetId() + ""));
            }
        }
    }
}