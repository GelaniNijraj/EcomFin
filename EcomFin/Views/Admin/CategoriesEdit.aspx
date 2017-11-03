<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Masters/Dashboard.master" AutoEventWireup="true" CodeBehind="CategoriesEdit.aspx.cs" Inherits="EcomFin.Views.Admin.CategoriesEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Edit Category</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <div class="row">
            <div class="column column-60">
                <h2>Edit Category</h2>
            </div>
            <div class="column column-40">
                <asp:Button ID="ButtonRemove" runat="server" Text="Remove" CssClass="float-right" style="margin: 8px;" OnClick="ButtonRemove_Click" />
            </div>
        </div>
        <div class="row">
            <div class="column">
                <label>Name <asp:TextBox ID="TextBoxName" CssClass="large_input" runat="server" /></label>
                <asp:Button ID="ButtonSave" runat="server" Text="Save" OnClick="ButtonSave_Click" />
                <a href="/admin/categories"><input type="button" value="Discard" /></a>
                <asp:Label ID="LabelMessage" runat="server"></asp:Label>
            </div>
        </div>
    </form>
</asp:Content>
