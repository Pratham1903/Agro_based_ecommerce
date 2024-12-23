<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testingotp.aspx.cs" Inherits="Final_Project.testingotp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 268px;
        }
        .auto-style3 {
            width: 282px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">Enter your number</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Width="168px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send Otp" />
                        </td>
                    </tr>
                </table>

            </asp:Panel>
        </div>
        <asp:Panel ID="Panel2" runat="server">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">Enter your otp number</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="verify" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </form>
</body>
</html>
