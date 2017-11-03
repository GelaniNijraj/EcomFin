<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Store/Store.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EcomFin.Views.Store.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Register or Login</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="column column-50">
            <h3>Login</h3>
            <label>Email <asp:TextBox ID="TextBoxLoginUsername" runat="server"></asp:TextBox></label>
            <label>Password <asp:TextBox ID="TextBoxLoginPassword" TextMode="Password" runat="server"></asp:TextBox></label>
            <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" /><asp:Label ID="LabelLoginMessage" runat="server" />
        </div>
        <div class="column column-50">
            <h3>Register</h3>
            <label>Name <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></label>
            <label>Email <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox></label>
            <label>Password <asp:TextBox ID="TextBoxPassword" TextMode="Password" runat="server"></asp:TextBox></label>
            <asp:Button ID="ButtonRegister" runat="server" Text="Register" />
        </div>
    </div>
</asp:Content>
