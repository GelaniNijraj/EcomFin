using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace EcomFin {
    public class CustomRoutes {
        public static RouteCollection RegisterAllRoutes(RouteCollection routes) {
            routes.MapPageRoute("AdminLogin", "admin/login", "~/Views/Admin/Login.aspx");

            routes.MapPageRoute("AdminProducts", "admin/products", "~/Views/Admin/Products.aspx");
            routes.MapPageRoute("AdminProductsAdd", "admin/products/new", "~/Views/Admin/ProductsAdd.aspx");

            routes.MapPageRoute("AdminOrders", "admin/orders", "~/Views/Admin/Orders.aspx");

            routes.MapPageRoute("AdminCategories", "admin/categories", "~/Views/Admin/Categories.aspx");
            routes.MapPageRoute("AdminCategoriesAdd", "admin/categories/new", "~/Views/Admin/CategoriesAdd.aspx");
            routes.MapPageRoute("AdminCategoriesEdit", "admin/categories/edit/{id}", "~/Views/Admin/CategoriesEdit.aspx");

            routes.MapPageRoute("AdminAttributes", "admin/attributes", "~/Views/Admin/Attributes.aspx");
            routes.MapPageRoute("AdminAttributesEdit", "admin/attributes/edit/{id}", "~/Views/Admin/AttributesEdit.aspx");

            routes.MapPageRoute("AdminSettings", "admin/settings", "~/Views/Admin/Settings.aspx");

            routes.MapPageRoute("StoreHome", "", "~/Views/Store/Index.aspx");
            routes.MapPageRoute("StoreCategories", "category/{category}", "~/Views/Store/Index.aspx");
            routes.MapPageRoute("StoreProduct", "product/{id}", "~/Views/Store/Product.aspx");
            routes.MapPageRoute("StoreSearch", "search/{query}", "~/Views/Store/Search.aspx");
            return routes;
        }
    }
}