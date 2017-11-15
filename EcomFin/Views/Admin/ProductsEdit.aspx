<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Masters/Dashboard.master" AutoEventWireup="true" CodeBehind="ProductsEdit.aspx.cs" Inherits="EcomFin.Views.Admin.ProductsEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Edit Product</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">    
    <form runat="server">
        <div class="row">
            <div class="column column-60">
                <h2>Edit Product</h2>
            </div>
            <div class="column column-40">
                <asp:Button ID="ButtonRemove" runat="server" Text="Remove" CssClass="float-right" style="margin: 8px;" OnClick="ButtonRemove_Click" />
            </div>
        </div>
        <div class="row">
            <div class="column">
                <label>
                    Title 
                    <asp:textbox CssClass="large_input" value='<%# product.Name %>' ID="TextBoxTitle" runat="server" />
                </label>
            </div>
        </div>
        <div class="row">
            <div class="column">
                <div class="row">
                    <div class="column column-50">
                        <label>Description <asp:TextBox ID="TextBoxDescription" value='<%# product.Description %>' runat="server"></asp:TextBox></label>
                        <label>Quantity <asp:TextBox ID="TextBoxQuantity" value='<%# product.Quantity %>' runat="server" TextMode="Number"></asp:TextBox></label>
                        <label>Category <asp:DropDownList ID="DropDownListCategories" runat="server" DataSourceID="ObjectDataSourceCategories" DataTextField="Name" DataValueField="Id"></asp:DropDownList></label>
                        <label>Price <asp:TextBox ID="TextBoxPrice" value='<%# product.Price %>' runat="server" TextMode="Number"></asp:TextBox>
                        <asp:ObjectDataSource 
                            ID="ObjectDataSourceCategories" 
                            TypeName="EcomFin.Controllers.Categories"
                            runat="server" SelectMethod="GetAll" />
                        </label>

                    </div>
                    <div class="column column-50" ID="Images" runat="server">

                    </div>
                </div>
                <asp:button ID="ButtonSave" runat="server" text="Save" OnClick="ButtonSave_Click" />
                <a href="/admin/products"><input type="button" value="DISCARD" /></a>
                <asp:Label ID="LabelMessage" runat="server"></asp:Label>
            </div>
        </div>
    </form>

</asp:Content>
