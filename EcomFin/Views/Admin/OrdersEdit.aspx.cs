using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class OrdersEdit : System.Web.UI.Page {
        public Order order;
        public ecomEntities db = new ecomEntities();
        protected void Page_Load(object sender, EventArgs e) {
            if (Page.RouteData.Values["id"] != null) {
                int id = Int32.Parse(Page.RouteData.Values["id"].ToString());
                order = db.Orders.Where(r => r.Id == id).First();
                if (order == null) {
                    Response.Redirect("/admin/orders");
                } else {
                    RepeaterOrderItems.DataSource = order.OrderItems.ToList();
                }
            } else {
                Response.Redirect("/admin/orders");
            }
            SetupStatusCodes();
            Page.DataBind();
        }

        public string GrandTotal() {
            decimal total = 0;
            foreach(var i in order.OrderItems) 
                total += (int)i.Quantity * (decimal)i.Price;
            return total.ToString("0.00");
        }

        private void SetupStatusCodes() {
            string[] codes = { "PENDING", "CANCELED", "SHIPPED", "DELIVERED" };
            if(DropDownListStatus.Items.Count == 0) {
                int c = 0;
                foreach (var i in codes) {
                    DropDownListStatus.Items.Add(i);
                    if (i == order.StatusCode)
                        DropDownListStatus.SelectedIndex = c;
                    c++;
                }
            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e) {
            order.StatusCode = DropDownListStatus.Text;
            db.SaveChanges();
            Response.Redirect("/admin/orders");
        }
    }
}