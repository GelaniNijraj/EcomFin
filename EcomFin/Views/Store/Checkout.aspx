<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Store/Store.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="EcomFin.Views.Store.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Checkout</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="column">
            <h2>Check out (<%= ch.ItemCount() %> items)</h2>
        </div>
    </div>
    
    <% if (ch.ItemCount() > 0) { %>
        <asp:Repeater ID="RepeaterProducts" runat="server" SelectMethod="GetCartProducts">
            <ItemTemplate>
                <div class="row">
                    <div class="column column-40">
                        <h4><%# Eval("Name") %> (<%# Eval("Category1.Name") %>)</h4>
                        <p>₹ <%# Eval("Price") %></p>
                    </div>
                    <div class="column column-20">
                        <p>Quantity : <%# ch.ParticularItemCount((int)Eval("Id")) %></p>
                    </div>
                    <div class="column column-40">
                        <h4 style="text-align: right;">₹ <%# GetTotalCost((int)Eval("Id")) %></h4>
                    </div>
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
                <hr />
            </SeparatorTemplate>
        </asp:Repeater>
        <div class="row">
            <div class="column">
                <h4 style="text-align: right;">Total : ₹ <%# GetGrandTotal() %></h4>
                <asp:Button ID="ButtonPlaceOrder" style="margin-left: 8px;"  CssClass="float-right" runat="server" Text="Place Order" OnClick="ButtonPlaceOrder_Click" />
                <asp:Button ID="ButtonClearCart" CssClass="float-right" runat="server" Text="Clear Cart" OnClick="ButtonClearCart_Click" />
            </div>
        </div>
    <% } else { %>
        <p>No items added yet.</p>
    <%} %>
</asp:Content>
