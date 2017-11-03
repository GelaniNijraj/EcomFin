<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Masters/Store.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="EcomFin.Views.Store.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title><%=cfg["SiteTitle"] %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <div class="row-center" style="height: 200px; background: url('/Images/doodles.png');">
        <div class="column">
            <h1 style="text-align: center; padding-top: 50px;"><%=cfg["SiteTitle"] %></h1>
            <h4 style="text-align: center;"><%=cfg["HeaderText"]%></h4>
        </div>
    </div>
    <div class="row">
        <div class="column column-25">
            <h4>Your Cart</h4>
            <p><input type="button" value='Check Out (<%= ch.ItemCount() %> Items)' /></p>
            <h4>Categories</h4>
            <a href="/">All (<%= products.GetAll().Count %>)</a><br />
            <% foreach (var c in categories.GetAll()) { %>
                <a href="/category/<%= c.Id %>"> <%= c.Name %>(<%= c.Products.Count %>)</a><br />
            <% } %>
        </div>
        <div class="column column-75">
            <div class="row row-wrap">
                <asp:Repeater ID="RepeaterProducts" runat="server" OnItemCommand="AddToCart">
                    <ItemTemplate>
                        <div class="column column-33 product-box">
                            <a href='/product/<%# Eval("Id") %>'><h3><%# Eval("Name") %></h3></a>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# GetImageURL(Eval("ProductImages")) %>' Width="300px" Height="300px" />
                            <div class="row">
                                <div class="column column-40">₹ <%# Eval("Price") %></div>
                                <div class="column column-60">
                                    <asp:Button CssClass="float-right" ID="Button1" runat="server" Text="Add To Cart" CommandName="ProductId" CommandArgument='<%# Eval("Id") %>' />
                                </div>
                            </div>

                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

    </div>
    <asp:ObjectDataSource ID="ObjectDataSourceProducts" runat="server" SelectMethod="GetAll" TypeName="EcomFin.Controllers.Products"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceProductsCategory" runat="server" SelectMethod="GetAllInCategory" TypeName="EcomFin.Controllers.Products">
        <SelectParameters>
            <asp:RouteParameter DefaultValue="0" Name="c" RouteKey="category" Type="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</asp:Content>
