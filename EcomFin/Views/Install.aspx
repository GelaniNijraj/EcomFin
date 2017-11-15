<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Install.aspx.cs" Inherits="EcomFin.Views.Install" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Installation</title>
    <link type="text/css" rel="stylesheet" href="~/App_Themes/normalize.css" />
    <link type="text/css" rel="stylesheet" href="~/App_Themes/milligram.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="column">
                <h1>Welcome to installation</h1>
                <hr />
            </div>
        </div>
        <div class="row">
            <div class="column">

                <asp:Wizard ID="WizardInstall" runat="server" OnFinishButtonClick="WizardInstall_FinishButtonClick">
                    <WizardSteps>
                        <asp:WizardStep runat="server" title="Admin Account">
                            <div class="row">
                                <div class="column column-50">
                                    <label>Username : <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox></label>
                                    <label>Password : <asp:TextBox ID="TextBoxPassword" runat="server"></asp:TextBox></label>
                                </div>
                            </div>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" title="Store Settings">
                            <div class="row">
                                <div class="column column-50">
                                    <label>Store Name : <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox></label>
                                    <label>Store Heading : <asp:TextBox ID="TextBoxHeading" runat="server"></asp:TextBox></label>
                                    <label>Store Footer : <asp:TextBox ID="TextBoxFooter" runat="server"></asp:TextBox></label>
                                </div>
                            </div>
                        </asp:WizardStep>
                        <asp:WizardStep runat="server" title="Finish">
                        </asp:WizardStep>
                    </WizardSteps>
                </asp:Wizard>
                <asp:Label runat="server" ID="LabelMessage"></asp:Label>

            </div>
        </div>
    </div>
    </form>
</body>
</html>
