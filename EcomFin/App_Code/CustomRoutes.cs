using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace EcomFin {
    public class CustomRoutes {
        public static RouteCollection RegisterAllRoutes(RouteCollection routes) {
            routes.MapPageRoute("AdminLogin", "admin/login", "~/Views/Admin/Login.aspx");
            routes.MapPageRoute("AdminHome", "admin", "~/Views/Admin/Products.aspx");

            routes.MapPageRoute("AdminProducts", "admin/products", "~/Views/Admin/Products.aspx");
            routes.MapPageRoute("AdminProductsAdd", "admin/products/new", "~/Views/Admin/ProductsAdd.aspx");
            routes.MapPageRoute("AdminProductsEdit", "admin/products/edit/{id}", "~/Views/Admin/ProductsEdit.aspx");

            routes.MapPageRoute("AdminOrders", "admin/orders", "~/Views/Admin/Orders.aspx");
            routes.MapPageRoute("AdminOrdersView", "admin/orders/view/{id}", "~/Views/Admin/OrdersEdit.aspx");

            routes.MapPageRoute("AdminAccount", "admin/account", "~/Views/Admin/Account.aspx");

            routes.MapPageRoute("AdminCategories", "admin/categories", "~/Views/Admin/Categories.aspx");
            routes.MapPageRoute("AdminCategoriesAdd", "admin/categories/new", "~/Views/Admin/CategoriesAdd.aspx");
            routes.MapPageRoute("AdminCategoriesEdit", "admin/categories/edit/{id}", "~/Views/Admin/CategoriesEdit.aspx");

            routes.MapPageRoute("AdminAttributes", "admin/attributes", "~/Views/Admin/Attributes.aspx");
            routes.MapPageRoute("AdminAttributesEdit", "admin/attributes/edit/{id}", "~/Views/Admin/AttributesEdit.aspx");

            routes.MapPageRoute("AdminSettings", "admin/settings", "~/Views/Admin/Settings.aspx");
            routes.MapPageRoute("AdminLogout", "admin/logout", "~/Views/Admin/Logout.aspx");

            routes.MapPageRoute("StoreHome", "", "~/Views/Store/Index.aspx");
            routes.MapPageRoute("StoreCategories", "category/{category}", "~/Views/Store/Index.aspx");
            routes.MapPageRoute("StoreProduct", "product/{id}", "~/Views/Store/Product.aspx");
            routes.MapPageRoute("StoreSearch", "search", "~/Views/Store/Index.aspx");
            routes.MapPageRoute("StoreCheckout", "checkout", "~/Views/Store/Checkout.aspx");
            routes.MapPageRoute("StoreRegister", "register", "~/Views/Store/Register.aspx");
            routes.MapPageRoute("StoreSettings", "settings", "~/Views/Store/Settings.aspx");
            routes.MapPageRoute("StoreLogout", "logout", "~/Views/Store/Logout.aspx");
            return routes;
        }
    }
}