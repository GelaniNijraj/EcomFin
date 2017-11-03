<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Masters/Dashboard.master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="EcomFin.Views.Admin.Categories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>All Categories</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="column column-60">
            <h2>All Categories</h2>
        </div>
        <div class="column column-40">
            <a href="categories/new"><input type="button" class="float-right" style="margin-top: 8px;" value="Add New" /></a>
        </div>
    </div>
    <% foreach (var c in categories) { %>
        <div class="row">
            <div class="column column-50">
                <h3><%= c.Name %></h3>
                <p><%= c.Products.Count %> Product(s)</p>
            </div>
            <div class="column column-50">
                <a href="categories/edit/<%= c.Id %>" class="float-right" style="margin-top: 16px;"><input type="button" value="Edit" /></a>
            </div>

        </div>
    <% } %>
</asp:Content>
