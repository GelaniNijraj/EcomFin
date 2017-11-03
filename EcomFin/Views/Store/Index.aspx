<%@ Page Title="" Language="C#" MasterPageFile="Store.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="EcomFin.Views.Store.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title><%=cfg["SiteTitle"] %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
    <asp:ObjectDataSource ID="ObjectDataSourceProducts" runat="server" SelectMethod="GetAll" TypeName="EcomFin.Controllers.Products"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceProductsCategory" runat="server" SelectMethod="GetAllInCategory" TypeName="EcomFin.Controllers.Products">
    <SelectParameters>
        <asp:RouteParameter DefaultValue="0" Name="c" RouteKey="category" Type="Int32" />
    </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
