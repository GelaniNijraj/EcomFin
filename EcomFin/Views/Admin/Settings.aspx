<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Masters/Dashboard.master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="EcomFin.Views.Admin.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Settings</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <div class="row">
            <div class="column"> 
                <h2>Settings</h2>               
                <label for="TextBoxStoreTitle">Store Title</label>
                <asp:TextBox ID="TextBoxStoreTitle" CssClass="large_input" runat="server" value='<%# cfg["SiteTitle"] %>' />
            </div>
        </div>
        <div class="row">
            <div class="column column-50">
                <label>
                    Store Description
                    <asp:TextBox ID="TextBoxDescription" runat="server" value='<%# cfg["SiteDescription"] %>' />
                </label>
            </div>
            <div class="column column-50">
                
                <label for="TextBoxDescription">
                    Header Text
                    <asp:TextBox ID="TextBoxHeader" runat="server" value='<%# cfg["HeaderText"] %>' />
                </label>
                <label>
                    Footer Text
                    <asp:TextBox ID="TextBoxFooter" runat="server" value='<%# cfg["FooterText"] %>' />
                </label>
            </div>
        </div>
        <div class="row">
            <div class="column">
                <asp:Button ID="ButtonSubmit" runat="server" Text="Update Settings" OnClick="ButtonSubmit_Click" />
                <asp:Label ID="LabelMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</asp:Content>
