<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Masters/Admin.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EcomFin.Views.Admin.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">   
    <title>Log-In</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <form id="form1" runat="server">
        <div class="row">
            <div class="column column-50">
                <h1>Log-In</h1>
                <label>Username<asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox></label>
                <label>Password<asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox></label>
                <asp:Button ID="ButtonLogin" runat="server" Text="Log-In" />
            </div>
        </div>
    </form>
    
</asp:Content>
