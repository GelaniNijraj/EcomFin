using EcomFin.Controllers.Validators;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class ProductsAdd : System.Web.UI.Page {
        ecomEntities db = new ecomEntities();
        protected void Page_Init(object sender, EventArgs e) {
            if(ViewState["attrs"] == null)
                ViewState["attrs"] = new List<Panel>();
        }

        protected void Page_Load(object sender, EventArgs e) {
        }

        protected void DropDownNameUpdated(object o, EventArgs e) {
            var d = (DropDownList)o;
            Debug.WriteLine(d.ID);
        }

        protected void ButtonAddImage_Click(object sender, EventArgs e) {
        }
        
        protected void ButtonRemove_Click(object sender, EventArgs e) {
        }

        protected void ButtonAddAttribute_Click(object sender, EventArgs e) {

        }

        protected void ButtonAdd_Click(object sender, EventArgs e) {
            Product p = new Product();
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
            var validator = new ProductValidator();
            var result = validator.Validate(p);
            if (result.IsValid) {
                db.Products.Add(p);
                db.SaveChanges();
                // Saving Images
                int counter = 0;
                foreach (var c in PanelImages.Controls) {
                    if (c is FileUpload) {
                        var uploader = (FileUpload)c;
                        if (uploader.HasFile) {
                            var image = new ProductImage();
                            image.Product = p.Id;
                            var name = uploader.FileName.Split('.');
                            var extension = name[name.Length - 1];
                            var finalName = p.Id + "_" + counter++ + "." + extension;
                            uploader.SaveAs(Server.MapPath("/Images/Products") + "/" + finalName);
                            image.URL = finalName;
                            db.ProductImages.Add(image);
                            db.SaveChanges();
                        }
                    }
                }
                Response.Redirect("/admin/products");
            } else {
                LabelMessage.Text = result.Errors.First().ErrorMessage;
            }
        }
    }
}