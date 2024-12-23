<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registeration.aspx.cs" Inherits="Final_Project.registeration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="~/CSS_Folder/user_Regi_form.css" />
    <script src="https://smtpjs.com/v3/smtp.js"></script>
</head>
<body>
       <form id="form1" runat="server">
        <div>
              <div class="container">
            <table align="center" class="auto-style3">
                <tr>
                    <td class="auto-style4" colspan="3"><h1>SIGN UP</h1></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style5" colspan="3">
                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter the Username" required="Please fill in this field"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5" id="email_id" colspan="3">
                        <asp:TextBox ID="TextBox2" runat="server" placeholder="Enter the email id" required="Please fill in this field" TextMode="Email" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter Valid Number" ValidationExpression="^(?!(\d)\1{9})[7,8,9]\d{9}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="3">
                        <asp:TextBox ID="TextBox3" runat="server" placeholder="Enter the phone number" required="Please fill in this field" TextMode="Phone"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5" colspan="3">
                        <asp:TextBox ID="TextBox4" runat="server"  placeholder="Enter the password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox4" ControlToValidate="TextBox7" ErrorMessage="Password does not match"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="3">
                        <asp:TextBox ID="TextBox7" runat="server" placeholder="Enter the confirm password" TextMode="Password" ></asp:TextBox>
                    </td>
               <%-- </tr>
                <asp:Panel ID="Panel1" runat="server">
                    <tr>
                        <td class="auto-style6" colspan="3">
                            <asp:Button ID="Button2" runat="server" Text="Send Otp" OnClick="Button2_Click" />
                        </td>
                    </tr>
                </asp:Panel>--%>
                 <%--<tr>
                    <td class="auto-style4" colspan="3">
                        <asp:TextBox ID="TextBox5" runat="server" placeholder="Enter Your OTP number" required="Please fill in this field" ></asp:TextBox>
                    </td>
                </tr>
                <asp:Panel ID="Panel2" runat="server">
                    <tr>
                        <td class="auto-style6" colspan="3">
                            <asp:Button ID="Button3" runat="server" Text="Verify" OnClick="Button3_Click" Visible="False" />
                        </td>
                    </tr>
                </asp:Panel>--%>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                 <%--<tr>
                    <td class="otpverify" colspan="3">
                         <asp:TextBox ID="TextBox5" runat="server" placeholder="Enter the Otp sent to your email"></asp:TextBox>
                        <asp:Button class="btn" runat="server"  id="otp_btn" text="Verify"/> 
                    </td>
                    <td>
                        <asp:Button runat="server" class="btn" OnClientClick="return sendOTP();" Text="Send OTP" />
                    </td>
                </tr>--%>
                <tr>
                    <td class="auto-style6" colspan="3">
                        <asp:Button ID="Button1" runat="server" Text="SIGN UP" OnClick="Button1_Click"  />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="3"><a href="Login.aspx">Already have an account? Log In</a>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:mini_projectConnectionString %>' SelectCommand="SELECT * FROM [user_regi]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
                   <div>
            
        </div>
        </div>
        </div>
          
    </form>
</body>
</html>

