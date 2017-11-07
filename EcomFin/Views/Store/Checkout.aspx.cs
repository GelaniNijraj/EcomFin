using EcomFin.Controllers;
using EcomFin.Controllers.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Store {
    public partial class Checkout : System.Web.UI.Page {
        public ConfigurationHelper cfg;
        public Categories categories;
        public Products products;
        public CartHelper ch;
        public UserHelper uh;
        public OrderHelper oh;
        public ecomEntities db = new ecomEntities();

        protected void Page_Load(object sender, EventArgs e) {
            cfg = new ConfigurationHelper();
            categories = new Categories();
            products = new Products();
            uh = new UserHelper(Session);
            ch = new CartHelper(Session["cart"]);
            oh = new OrderHelper();
            if (uh.IsLoggedIn(Session) && DropDownListAddress.Items.Count == 0) {
                DropDownListAddress.Items.Add(new ListItem("Select an address", "0"));
                foreach (var a in uh.Customer.Addresses.ToList())
                    DropDownListAddress.Items.Add(new ListItem(a.LineOne + "," + a.Street + " (" + a.ZIP + ")", a.Id + ""));
            }
            Page.DataBind();
        }

        public List<EcomFin.Product> GetCartProducts() {
            List<EcomFin.Product> list = new List<EcomFin.Product>();
            foreach(var i in ch.GetProducts()) {
                list.Add(db.Products.Where(r => r.Id == i.Key).First());
            }
            return list;
        }

        public double GetTotalCost(int id) {
            return ch.ParticularItemCount(id) * (double)db.Products.Where(r => r.Id == id).First().Price;
        }

        public double GetGrandTotal() {
            double cost = 0.0;
            foreach (var i in ch.GetProducts().Keys)
                cost += GetTotalCost(i);
            return cost;
        }

        protected void ButtonClearCart_Click(object sender, EventArgs e) {
            ch.Clear();
            Session["cart"] = ch.Cart;
        }

        protected void ButtonPlaceOrder_Click(object sender, EventArgs e) {
            if (uh.IsLoggedIn(Session)) {
                int address = 0;
                if(DropDownListAddress.SelectedValue == "0") {
                    var a = new Address();
                    a.LineOne = TextBoxHome.Text;
                    a.Street = TextBoxStreet.Text;
                    a.City = TextBoxCity.Text;
                    a.State = TextBoxState.Text;
                    a.Country = TextBoxCountry.Text;
                    a.ZIP = TextBoxZip.Text;
                    a.Customer = uh.Customer.Id;
                    var validator = new AddressValidator();
                    var result = validator.Validate(a);
                    if (result.IsValid) {
                        db.Addresses.Add(a);
                        db.SaveChanges();
                        address = a.Id;
                    } else {
                        LabelMessageAddress.Text = result.Errors.First().ErrorMessage;
                        return;
                    }
                }else {
                    address = Int32.Parse(DropDownListAddress.SelectedValue);
                }
                oh.PlaceHolder(ch.Cart, uh.Customer, address);
                ch.Clear();
                Session["cart"] = ch.Cart;
                Response.Redirect("/");
            }else {
                Response.Redirect("/register?redirect=checkout");
            }
        }
    }
}