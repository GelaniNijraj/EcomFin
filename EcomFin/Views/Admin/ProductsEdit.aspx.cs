using EcomFin.Controllers.Validators;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class ProductsEdit : System.Web.UI.Page {
        public Product product;
        public ecomEntities db = new ecomEntities();
        protected void Page_Load(object sender, EventArgs e) {
            if (Page.RouteData.Values["id"] != null) {
                int id = Int32.Parse(Page.RouteData.Values["id"].ToString());
                product = db.Products.Where(r => r.Id == id).First();
                TextBoxPrice.Attributes["value"] = product.Price + "";
                TextBoxDescription.Attributes["value"] = product.Description;
                TextBoxTitle.Attributes["value"] = product.Name;
                TextBoxQuantity.Attributes["value"] = product.Quantity + "";
            } else {
                product = db.Products.First();
            }
        }

        protected void ButtonSave_Click(object sender, EventArgs e) {
            var p = product;
            db.Products.Attach(p);
            p.Name = TextBoxTitle.Text;
            p.Description = TextBoxDescription.Text;
            try {
                p.Price = Decimal.Parse(TextBoxPrice.Text);
            } catch {
                LabelMessage.Text = "'Price' should be a number";
            }
            try {
                p.Quantity = Int32.Parse(TextBoxQuantity.Text);
            } catch {
                LabelMessage.Text = "'Price' should be a number";
            }
            p.MeasuredIn = "nos";
            p.Category = Int32.Parse(DropDownListCategories.SelectedItem.Value);
            Debug.WriteLine(p.Category + " " + Int32.Parse(DropDownListCategories.SelectedItem.Value));
            var validator = new ProductValidator();
            var result = validator.Validate(p);
            if (result.IsValid) {
                db.SaveChanges();
                Response.Redirect("/admin/products");
            } else {
                LabelMessage.Text = result.Errors.First().ErrorMessage;
            }
        }

        protected void ButtonRemove_Click(object sender, EventArgs e) {
            db.Products.Remove(product);
            db.SaveChanges();
            Response.Redirect("/admin/products");
        }
    }
}