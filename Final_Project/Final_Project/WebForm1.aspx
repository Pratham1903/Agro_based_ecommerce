<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="smsTwil.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <asp:Label ID="Label3" runat="server" Text="name : "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="phone : "></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="login" />
        <br />
        &nbsp;<div>
            <asp:Label ID="Label2" runat="server" Text="OTP"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="verify" />
            <br />
            <br />
            <asp:Label ID="Msg" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
