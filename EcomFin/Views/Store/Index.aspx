<%@ Page Title="" Language="C#" MasterPageFile="Store.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="EcomFin.Views.Store.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title><%=cfg["SiteTitle"] %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row row-wrap">
        <asp:Label runat="server" ID="LabelNoProducts"></asp:Label>
        <asp:Repeater ID="RepeaterProducts" runat="server" OnItemCommand="AddToCart" DataSourceID="ObjectDataSourceSearch">
            <ItemTemplate>
                <div class="column column-33 product-box">
                    <a href='/product/<%# Eval("Id") %>'><h6><%# ShortenName((string)Eval("Name"), 30) %></h6></a>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# GetImageURL(Eval("ProductImages")) %>' Width="300px" />
                    <div class="row">
                        <div class="column column-40">₹ <%# Eval("Price", "{0:0.00}") %></div>
                        <div class="column column-60">
                            <asp:Button CssClass="float-right" ID="Button1" runat="server" Text="Add To Cart" CommandName="ProductId" CommandArgument='<%# Eval("Id") %>' />
                        </div>
                    </div>

                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSourceSearch" OnSelected="ObjectDataSourceSearch_Selected" runat="server" SelectMethod="GetAllSearch" TypeName="EcomFin.Controllers.Products" />
</asp:Content>
