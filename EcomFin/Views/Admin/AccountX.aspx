<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Masters/Dashboard.master" AutoEventWireup="true" CodeBehind="AccountX.aspx.cs" Inherits="EcomFin.Views.Admin.AccountX" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Account</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <div class="row">
            <div class="column">
                <h2>Account</h2>
            </div>
        </div>
        <div class="row">
            <div class="column column-50">
                <label>Username<asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox></label>
                <label>Password<asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox></label>
                <asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
                <asp:Label ID="LabelMessage" runat="server"></asp:Label>
            </div>
        </div>
    </form>
</asp:Content>
