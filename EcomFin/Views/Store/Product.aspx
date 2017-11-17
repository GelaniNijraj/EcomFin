<%@ Page Title="" Language="C#" MasterPageFile="Store.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="EcomFin.Views.Store.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title><%= product.Name %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="column column-50">
            <h2><%= product.Name %></h2>
        </div>
        <div class="column column-50">
            <div class="row">
                <div class="column column-60">
                    <asp:TextBox ID="TextBoxQuantity" runat="server" value="1"></asp:TextBox>
                </div>
                <div class="column column-40">
                    <asp:Button ID="ButtonAddToCart" runat="server" Text="Add to cart" OnClick="ButtonAddToCart_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="column">
            <label>Price : </label>₹ <%= product.Price %>
            
            
            <div class="row">
                <div class="column column-80">
                    <label>Image :</label>
                    <% Image1.ImageUrl = GetImageURL(); Image1.DataBind(); %>
                    <asp:Image ID="Image1" runat="server" Width="440px"/>
                </div>
            </div>
            <label>Description :</label>
            <p><%= product.Description %></p>
        </div>
    </div>
</asp:Content>
