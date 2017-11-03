<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Masters/Dashboard.master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="EcomFin.Views.Admin.Products" %>
<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <title>Products</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <div class="row">
        <div class="column column-60">
            <h2>All Products</h2>
        </div>
        <div class="column column-40">
            <a href="products/new" style="float: right; margin-top: 8px;"><input type="button" value="Add New" /></a>
        </div>
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" BorderStyle="None" DataSourceID="ObjectDataSourceProducts">
            <AlternatingRowStyle BackColor="#F3F3F3" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Category1.Name" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <a href='products/edit/<%# Eval("Id") %>'>Edit</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource 
            ID="ObjectDataSourceProducts" 
            runat="server" 
            SelectMethod="GetAll"
            TypeName="EcomFin.Controllers.Products" />
    </form>
    </asp:Content>
