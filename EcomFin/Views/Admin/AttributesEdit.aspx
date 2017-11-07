<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Masters/Dashboard.master" AutoEventWireup="true" CodeBehind="AttributesEdit.aspx.cs" Inherits="EcomFin.Views.Admin.AttributesEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Attribute</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form runat="server">
        <div class="row">
            <div class="column column-70">
                <label>Name <asp:TextBox ID="TextBoxName" runat="server" class="large_input" value='<%= attribute.Name  %>'></asp:TextBox></label>
            </div>
        </div>
        <div class="row">
            <div class="column column-50">
                <label>Values</label>
                <asp:GridView 
                    ID="GridViewValues" 
                    runat="server" 
                    CssClass="hidden"
                    AutoGenerateColumns="False" 
                    DataKeyNames="Id"
                    DataSourceID="ObjectDataSourceValues">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                        <asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" />
                        <asp:CommandField ShowEditButton="True" />
                    </Columns>
                </asp:GridView>

                <asp:ObjectDataSource 
                    ID="ObjectDataSourceValues" 
                    runat="server" 
                    SelectMethod="GetValues" 
                    UpdateMethod="Update"
                    DataObjectTypeName="EcomFin.AttributeValue"
                    TypeName="EcomFin.Controllers.AttributesHelper">
                    <SelectParameters>
                        <asp:RouteParameter DefaultValue="0" Name="id" RouteKey="id" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>

            </div>
            <div class="column column-50">
                <label>New Value <asp:TextBox id="TextBoxValue" runat="server" /></label>
                <asp:Button ID="ButtonAddValue" runat="server" Text="Add Value" OnClick="ButtonAddValue_Click" />
            </div>
        </div>
        <div class="row">
            <div class="column">
                <asp:Button ID="ButtonSave" runat="server" Text="Save Changes" OnClick="ButtonSave_Click" />
            </div>
        </div>
    </form>
</asp:Content>
