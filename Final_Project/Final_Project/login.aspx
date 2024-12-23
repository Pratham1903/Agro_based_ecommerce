<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Final_Project.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="~/CSS_Folder/login.css">
</head>
<body>
     <form id="form1" runat="server">
        <div>
             <div>
            <div>
                <table align="center" class="auto-style3">
                    <tr>
                        <td class="auto-style4" colspan="3"><h1>LOG IN</h1></td>
                    </tr>
                    <tr>
                        <td class="auto-style5" colspan="3">
                            <asp:TextBox ID="TextBoxUsername" runat="server" placeholder="Enter your username" required="Please fill in this field"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5" colspan="3">
                            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" placeholder="Enter your password" required="Please fill in this field"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6" colspan="3">
                            <asp:Button ID="ButtonLogin" runat="server" Text="Login" OnClick="ButtonLogin_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" colspan="3" align="center">
                            <a href="registeration.aspx">Don't have an account? Sign Up</a>
                        </td>
                    </tr>
                     <tr>
                        <td class="auto-style2">
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>
        </div>
    </form>
</body>
</html>
