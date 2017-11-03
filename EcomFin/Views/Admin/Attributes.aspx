<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Masters/Dashboard.master" AutoEventWireup="true" CodeBehind="Attributes.aspx.cs" Inherits="EcomFin.Views.Admin.Attributes" %>
<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <title>Attributes</title>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="MainContent">
    <form id="form1" runat="server">
    <div class="row">
        <div class="column">
            <h2>Attributes</h2>
        </div>
    </div>
    <div class="row">
        <% foreach (var a in attrs.GetNames()) { %>
            <div class="column column-25">
                <h3><%= a.Name %></h3>
                <a href="attributes/edit/<%= a.Id %>">Edit</a> | 
                <a href="#">Remove</a>
            </div>
        <% } %>
    </div>
    </form>
</asp:Content>