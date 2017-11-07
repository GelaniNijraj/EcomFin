<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Masters/Dashboard.master" AutoEventWireup="true" CodeBehind="OrdersEdit.aspx.cs" Inherits="EcomFin.Views.Admin.OrdersEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>View Order</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <div class="row">
            <div class="column">
                <h2>Order Details</h2>
            </div>
        </div>
        <div class="row">
            <div class="column column-50">
                <h4>Order Items</h4>
                <asp:Repeater ID="RepeaterOrderItems" runat="server">
                    <ItemTemplate>
                        <h5><%# Eval("Product1.Name") %> x <%# Eval("Quantity") %></h5>
                        <h6>₹ <%# ((decimal)Eval("Price") * (int)Eval("Quantity")).ToString("0.00") %></h6>
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <hr />
                    </SeparatorTemplate>
                    <FooterTemplate>
                        <h4><label class="label-inline">Grand Total : </label> ₹ <%= GrandTotal() %></h4>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="column column-50">
                <h4>Customer Details</h4>
                <p>
                    <label class="label-inline">Name : </label> <%= order.Customer1.Name %><br />
                    <label class="label-inline">Email : </label> <%= order.Customer1.Email %>
                </p>
                <h4>Delivery Address</h4>
                <p>
                    <%= order.Address.LineOne %>, <br />
                    <%= order.Address.Street %>, <br />
                    <%= order.Address.City %>, <br />
                    <%= order.Address.State%>, <br />
                    <%= order.Address.Country %>, <br />
                    <%= order.Address.ZIP %>, <br />
                </p>
                <h4>Update Status</h4>
                <asp:DropDownList ID="DropDownListStatus" runat="server"></asp:DropDownList>
                <asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
            </div>
        </div>
    </form>
</asp:Content>
