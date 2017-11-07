<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Masters/Dashboard.master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="EcomFin.Views.Admin.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Orders</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <div class="row">
        <div class="column">
            <h2>Orders</h2>
        </div>
    </div>
    <div class="row">
        <div class="column">
            <asp:GridView 
                ID="GridViewOrders" 
                runat="server" 
                AutoGenerateColumns="false"
                DataSourceID="ObjectDataSourceOrders">
                <Columns>
                    <asp:BoundField HeaderText="Order ID" DataField='Id' />
                    <asp:BoundField HeaderText="Customer Name" DataField='Customer1.Name' />
                    <asp:BoundField HeaderText="Status" DataField="StatusCode" />
                    <asp:BoundField HeaderText="Placed On" DataField="PlacedOn" />
                    <asp:HyperLinkField HeaderText="Action" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="/admin/orders/view/{0}" Text="View" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource 
                ID="ObjectDataSourceOrders" 
                TypeName="EcomFin.Controllers.OrderHelper"
                SelectMethod="GetAll"
                runat="server"></asp:ObjectDataSource>
        </div>
    </div>
    </form>
</asp:Content>
