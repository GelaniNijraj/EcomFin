﻿using EcomFin.Controllers;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class Attributes : System.Web.UI.Page {
        public AttributesHelper attrs = new AttributesHelper();

        protected void Page_Load(object sender, EventArgs e) {
            Page.DataBind();
        }
    }
}