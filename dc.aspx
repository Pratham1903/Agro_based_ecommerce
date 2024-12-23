<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dc.aspx.cs" Inherits="Final_Project.dc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delivery Address Confirmation</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        .header {
            background-color: #2f4f4f;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .header .logo {
            display: flex;
            align-items: center;
        }
        .header .logo img {
            height: 40px;
        }
        .header .search-bar {
            flex-grow: 1;
            margin: 0 20px;
            display: flex;
            align-items: center;
        }
        .header .search-bar input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px 0 0 4px;
            outline: none;
        }
        .header .search-bar button {
            padding: 8px 15px;
            border: none;
            background-color: #ff9900;
            color: white;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
        }
        .header .actions {
            display: flex;
            align-items: center;
        }
        .header .actions a {
            margin-left: 15px;
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
        }
        .header .actions a img {
            height: 20px;
            margin-right: 5px;
        }
        .header .language-selector {
            display: flex;
            align-items: center;
            margin-right: 20px;
        }
        .header .language-selector button {
            background: none;
            border: none;
            color: white;
            font-size: 14px;
            cursor: pointer;
            padding: 0 10px;
        }
        .header .contact-number {
            background-color: #ff9900;
            padding: 5px 10px;
            color: white;
            border-radius: 4px;
            font-size: 14px;
        }

        .delivery-section {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .delivery-header {
            background: linear-gradient(90deg, #8bc34a, #4caf50);
            color: #fff;
            padding: 20px;
            border-radius: 10px 10px 0 0;
            text-align: center;
        }

        .delivery-header h1 {
            font-size: 24px;
            margin: 0;
        }

        .delivery-form {
            margin-top: 20px;
        }

        .delivery-form label {
            font-size: 16px;
            margin-bottom: 5px;
            color: #4caf50;
            display: block;
        }

        .delivery-form input[type="text"],
        .delivery-form input[type="tel"],
        .delivery-form select {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
        }

        .submit-button {
            padding: 15px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            box-sizing: border-box;
            transition: background-color 0.3s ease;
        }

        .submit-button:hover {
            background-color: #45a049;
        }

        .submit-button:focus {
            outline: none;
            box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
        }

        .checkbox-container {
            display: flex;
            align-items: center;
        }

        .checkbox-container input[type="checkbox"] {
            margin-right: 10px;
        }
        #google_translate_element {
            margin: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 250px;
            font-family: Arial, sans-serif;
        }

        .goog-te-combo {
            width: 100%;
            padding: 5px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="logo">
                <img src="seeds%20image/kfig-removebg-preview.png" alt="BigHaat Logo">
            </div>
            <div class="search-bar">
                <input type="text" placeholder="Search...">
                <button>🔍</button>
            </div>
            <div class="actions">
                
                ]
                <a href="#"><img src="seeds%20image/logout-removebg-preview.png" alt="Login"> Login</a>
                <a href="#"><img src="seeds%20image/cart-removebg-preview.png" alt="Cart"> Cart</a>
                <div class="contact-number">Missed Call To Order: 1800-3000-2434</div>
            </div>
            <div id="google_translate_element"></div>
    <script type="text/javascript">
        function loadGoogleTranslate() {
            new google.translate.TranslateElement({
                pageLanguage: 'en',
                includedLanguages: 'hi,mr'
            }, 'google_translate_element');
        }

        (function () {
            var gt = document.createElement('script');
            gt.type = 'text/javascript';
            gt.async = true;
            gt.src = 'https://translate.google.com/translate_a/element.js?cb=loadGoogleTranslate';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(gt, s);
        })();
    </script>
        </div>
        <div class="delivery-section">
            <div class="delivery-header">
                <h1>Delivery Address</h1>
            </div>
            <div class="delivery-form">
                <label for="Name">Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="Name" ForeColor="Red"></asp:RequiredFieldValidator>
                </label>
                &nbsp;<asp:TextBox ID="Name" runat="server"  />

                <label for="Mobile">Mobile Number        <asp:TextBox ID="Mobile" runat="server" />

                <label for="Country">Country<asp:RequirCountry<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ControlToValidate="Country" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </label>
&nbsp;<asp:DropDownList ID="Country" runat="server">
                    <asp:ListItem Text="India" Value="India" />
                    
                </asp:DropDownList>

                <label for="Pincode">Pincode*        <asp:TextBox ID="Pincode" runat="server"  />

                <label for="State">State*</label>
                <asp:DropDownList ID="State" runat="server">
                    <asp:ListItem Text="Bihar" Value="Bihar" />
                    
                </asp:DropDownList>

                <label for="District">District<asp:RequiDistrict<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ControlToValidate="District" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </label>
&nbsp;<asp:TextBox ID="District" runat="server" />

                <label for="City">City / Village / Mandal / Taluk<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="City" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </label>
&nbsp;<asp:TextBox ID="City" runat="server" />

                <label for="Address">Address<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="Address" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </label>&nbsp;<asp:TextBox ID="Address" runat="server" TextMode="MultiLine" />

                <label for="Landmark">Landmark</label>
                <asp:TextBox ID="Landmark" runat="server"  />

                <div class="checkbox-container">
                    <asp:CheckBox ID="SaveInfo" runat="server" />
                    <label for="SaveInfo">Save this information for next timetion for next time        
                </div>

                <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="submit-button" OnClick="Button1_Click" />
            </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*Enter PINCODE" ControlToValidate="Pincode" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*Enter State" ControlToValidate="State" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </form>
</body>
</html>


