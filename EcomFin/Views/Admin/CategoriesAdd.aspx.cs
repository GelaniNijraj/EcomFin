using EcomFin.Controllers.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class CategoriesAdd : System.Web.UI.Page {
        public ecomEntities db = new ecomEntities();
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void ButtonSave_Click(object sender, EventArgs e) {
            var category = new Category();
            category.Name = TextBoxName.Text;
            var validator = new CategoryValidator();
            var result = validator.Validate(category);
            if (result.IsValid) {
                db.Categories.Add(category);
                db.SaveChanges();
                Response.Redirect("/admin/categories");
            } else {
                LabelMessage.Text = result.Errors.First().ErrorMessage;
            }
        }
    }
}