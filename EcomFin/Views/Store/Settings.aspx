<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Store/Store.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="EcomFin.Views.Store.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Settings</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="column">    
            <h2>Settings</h2>
        </div>
    </div>

    <div class="row">
        <div class="column column-50">
            <h3>Account</h3>
        </div>
    </div>

    <div class="row">
        <div class="column column-50">
            <label>Email <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox></label>
            <asp:Button ID="ButtonUpdate" runat="server" Text="Update" OnClick="ButtonUpdate_Click" />
            <asp:Label ID="LabelUpdateMessage" runat="server"></asp:Label>
        </div>
        <div class="column column-50">
            <label>Password <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox></label>
        </div>
    </div>

    <div class="row">
        <div class="column">
            <h3>Your Orders</h3>
            <asp:GridView 
                ID="GridViewOrders" 
                runat="server"
                DataSourceID="ObjectDataSourceOrders"
                AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" />
                    <asp:BoundField HeaderText="Placed On" DataField="PlacedOn" />
                    <asp:BoundField HeaderText="Status" DataField="StatusCode" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource
                ID="ObjectDataSourceOrders"
                SelectMethod="GetAll"
                TypeName="EcomFin.Controllers.OrderHelper"
                runat="server" />
        </div>
    </div>

    <div class="row">
        <div class="column">
            <h3>Address</h3>

            <asp:GridView 
                ID="GridViewAddress" 
                AutoGenerateColumns="False" 
                runat="server" 
                DataSourceID="ObjectDataSourceAddress" 
                CssClass="hidden" 
                DataKeyNames="Id">
                <Columns>
                    <asp:BoundField HeaderText="Id" DataField="Id" />
                    <asp:BoundField HeaderText="Home" DataField="LineOne" />
                    <asp:BoundField HeaderText="Street" DataField="Street" />
                    <asp:BoundField HeaderText="City" DataField="City" />
                    <asp:BoundField HeaderText="State" DataField="State" />
                    <asp:BoundField HeaderText="Country" DataField="Country" />
                    <asp:BoundField HeaderText="Zip" DataField="Zip" />
                    <asp:CommandField ShowDeleteButton="true" />
                </Columns>
            </asp:GridView>

            <asp:ObjectDataSource 
                ID="ObjectDataSourceAddress" 
                runat="server" 
                SelectMethod="GetAll" 
                UpdateMethod="Update"
                DeleteMethod="Delete"
                DataObjectTypeName="EcomFin.Address"
                TypeName="EcomFin.Controllers.AddressHelper" />
            
        </div>
    </div>

</asp:Content>
