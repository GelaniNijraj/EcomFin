﻿<%@ Page Title="" Language="C#" MasterPageFile="Store.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="EcomFin.Views.Store.Product" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title><%= product.Name %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="column">
            <h2><%= product.Name %></h2>
            <label>Price : </label>₹ <%= product.Price %>
            <asp:Image 
                Height="300px"
                Width="300px"
                ID="ImageSlideShow" 
                runat="server" />
            <asp:Button ID="ButtonPrevious" runat="server" Text="Previous" />
            <asp:Label ID="LabelImageTitle" runat="server" Text="Label"></asp:Label>
            <asp:Button ID="ButtonNext" runat="server" Text="Next" />

            <ajax:SlideShowExtender 
                AutoPlay="true"
                TargetControlID="ImageSlideShow"
                SlideShowServiceMethod="GetImages"
                ImageHeight="300"
                ImageWidth="300"
                NextButtonID="ButtonNext"
                PreviousButtonID="ButtonPrevious"
                ImageTitleLabelID="LabelImageTitle"
                runat="server" />
            <label>Description :</label>
            <p><%= product.Description %></p>
        </div>
    </div>
</asp:Content>
