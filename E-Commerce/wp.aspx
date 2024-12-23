﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wp.aspx.cs" Inherits="Final_Project.wp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Query Page</title>
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

        .query-section {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .query-header {
            text-align: center;
            margin-bottom: 30px;
            background: linear-gradient(90deg, #8bc34a, #4caf50);
            color: #fff;
            padding: 20px;
        }

        .query-header h1 {
            font-size: 28px;
            margin: 0;
        }

        .query-form {
            display: flex;
            flex-direction: column;
        }

        .query-form label {
            font-size: 16px;
            margin-bottom: 5px;
            color: #4caf50;
        }

        .query-form input[type="text"],
        .query-form input[type="email"],
        .query-form textarea {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            box-sizing: border-box;
        }

        .query-form button {
            padding: 10px;
            background-color: #ff4c4c;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .query-form button:hover {
            background-color: #e43e3e;
        }

        .submit-button {
        padding: 10px 20px;
        background-color: #4caf50; /* Agriculture-themed green */
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
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

        <div class="query-section">
            <div class="query-header">
                <h1>Submit Your Query</h1>
            </div>
            <div class="query-form">
                <label for="Name">Name:</label>
                <asp:TextBox ID="Name" runat="server" />

                <label for="Msg">Query:</label>
                <asp:TextBox ID="Msg" runat="server" TextMode="MultiLine" Height="187px" />

                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" CssClass="submit-button" />
            </div>
        </div>
        <div class="footer">
        <div class="footer-container">
            <div class="footer-column">
                <img src="seeds image/kfig-removebg-preview.png" alt="BigHaat Logo" style="width: 250px;">
                <p>Kalakankar Farmers Interest Group is dedicated to providing high-quality seeds, pesticides, and small agricultural tools to support the farming community. Established by the ICAR - Indian Council of Agricultural Research,under Ministry of Agriculture,our mission is to empower farmers with the resources they need to enhance productivity and promote sustainable agricultural practices. We are committed to fostering innovation and excellence in farming, ensuring that our products meet the highest standards of quality and reliability. Join us in our journey to revolutionize agriculture and create a thriving ecosystem for farmers.</p>
                <div class="social-icons">
                    <a href="https://www.instagram.com/officialicarindia/?hl=en"><img src="seeds image/igg-removebg-preview.png" alt="Instagram"></a>
                    <a href="https://www.youtube.com/user/icarindia"><img src="seeds image/you-removebg-preview.png" alt="YouTube"></a>
                    <a href="https://x.com/icarindia?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor"><img src="seeds image/tei-removebg-preview.png" alt="Twitter"></a>
                    <a href=""><img src="seeds image/gmail.png" alt="LinkedIn"></a>
                </div>
            </div>
            <div class="footer-column">
                <h3>Quick Links</h3>
                <ul>
                    
                    
                    <li><a href="knowledge.aspx">News</a></li>
                    <li><a href="contactus.aspx">Kisan Seva (Contact Us)</li>
                    <li><a href="seeds.aspx">Seeds</a></li>
                    <li><a href="crop_protection.aspx">Crop Protection</a></li>
                    <li><a href="organic.aspx">Organic Farming</a></li>
                    <li><a href="#">Equipments</a></li>
                    <li><a href="faq.aspx">FAQ</a></li>
                    
                </ul>
            </div>
            <div class="footer-column contact-info">
                <h3>Contact Us</h3>
                <div>Missed Call To Order: <strong>1800 XXXX  XXXX</strong></div>
                <div>Whatsapp: <strong>+91 XXXX XXXXXX</strong></div>
            </div>
        </div>
        <div class="footer-bottom">
            &copy; 2023 Kalakankar Farmers Interest Group
        </div>
    </div>
    </form>
</body>
</html>

