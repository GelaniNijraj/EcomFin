<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Masters/Dashboard.Master" AutoEventWireup="true" CodeBehind="ProductsAdd.aspx.cs" Inherits="EcomFin.Views.Admin.ProductsAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Add new product</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <div class="row">
            <div class="column">
                <h2>New Product</h2>
            </div>
        </div>
        <div class="row">
            <div class="column">
                <label>Title <asp:textbox CssClass="large_input" ID="TextBoxTitle" runat="server"></asp:textbox></label>
            </div>
        </div>
        <div class="row">
            <div class="column">
                <div class="row">
                    <div class="column column-50">
                        <label>Description <asp:TextBox ID="TextBoxDescription" runat="server" TextMode="MultiLine"></asp:TextBox></label>
                        <label>Quantity <asp:TextBox ID="TextBoxQuantity" runat="server" TextMode="Number"></asp:TextBox></label>
                        <label>Category <asp:DropDownList ID="DropDownListCategories" runat="server" DataSourceID="ObjectDataSourceCategories" DataTextField="Name" DataValueField="Id"></asp:DropDownList></label>
                        <label>Price <asp:TextBox ID="TextBoxPrice" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:ObjectDataSource 
                            ID="ObjectDataSourceCategories" 
                            TypeName="EcomFin.Controllers.Categories"
                            runat="server" SelectMethod="GetAll" />
                        </label>

                    </div>
                    <div class="column column-50" ID="Images" runat="server">
                        <asp:Panel ID="PanelImages" runat="server">
                            <label>Images</label>
                            <div class="row">
                                <div class="column"><asp:FileUpload runat="server" /></div>
                            </div>
                            <div class="row">
                                <div class="column"><asp:FileUpload runat="server" /></div>
                            </div>
                            <div class="row">
                                <div class="column"><asp:FileUpload runat="server" /></div>
                            </div>
                        </asp:Panel>

                    </div>
                </div>
                <asp:button ID="ButtonAdd" runat="server" text="ADD" OnClick="ButtonAdd_Click" />
                <a href="/admin/products"><input type="button" value="DISCARD" /></a>
                <asp:Label ID="LabelMessage" runat="server" ></asp:Label>
            </div>
        </div>
    </form>
</asp:Content>
