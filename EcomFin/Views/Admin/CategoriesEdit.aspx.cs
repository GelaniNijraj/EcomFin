using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EcomFin.Views.Admin {
    public partial class CategoriesEdit : System.Web.UI.Page {
        public ecomEntities db = new ecomEntities();
        public Category category;
        protected void Page_Load(object sender, EventArgs e) {
            int id = 0;
            try {
                id = Int32.Parse(Page.RouteData.Values["id"].ToString());
                category = db.Categories.Where(r => r.Id == id).First();
            } catch{
                Response.Redirect("/admin/categories");
            }
            TextBoxName.Attributes["value"] = category.Name;
        }

        protected void ButtonSave_Click(object sender, EventArgs e) {
            category.Name = TextBoxName.Text;
            db.SaveChanges();
            Response.Redirect("/admin/categories");
        }

        protected void ButtonRemove_Click(object sender, EventArgs e) {
            if (category.Products.Count > 0)
                LabelMessage.Text = "Can not remove a category while used by a product";
            else {
                db.Categories.Remove(category);
                db.SaveChanges();
                Response.Redirect("/admin/categories");
            }
        }
    }
}