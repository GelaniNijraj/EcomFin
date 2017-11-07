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
    
        <div class="row">
            <div class="column column-50">
                <h3>Order details</h3>
            </div>
        </div>
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
            </div>
        </div>
    
        <% if (uh.IsLoggedIn(Session)) { %>
        <div class="row">
            <div class="column column-50">
                <h3>Delivery address</h3>
                <label>Home <asp:TextBox ID="TextBoxHome" runat="server" /></label>
                <label>Street <asp:TextBox ID="TextBoxStreet" runat="server" /></label>
                <label>City <asp:TextBox ID="TextBoxCity" runat="server" /></label>
                <label>State <asp:TextBox ID="TextBoxState" runat="server" /></label>
                <label>Country <asp:TextBox ID="TextBoxCountry" runat="server" /></label>
                <label>Zip <asp:TextBox ID="TextBoxZip" runat="server" /></label>
                <asp:Label ID="LabelMessageAddress" runat="server"></asp:Label>
            </div>
            <div class="column column-50">
                <h3>Choos existing address</h3>
                <label>Your addresses <asp:DropDownList ID="DropDownListAddress" runat="server" /></label>
            </div>
        </div>
        <% } %>

        <div class="row">
            <div class="column">
                <asp:Button ID="ButtonPlaceOrder" style="margin-left: 8px;"  CssClass="float-right" runat="server" Text="Place Order" OnClick="ButtonPlaceOrder_Click" />
                <asp:Button ID="ButtonClearCart" CssClass="float-right" runat="server" Text="Clear Cart" OnClick="ButtonClearCart_Click" />
            </div>
        </div>
    <% } else { %>
        <p>No items added yet.</p>
    <%} %>
</asp:Content>
