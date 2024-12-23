<%@ Page Title="Vegetable seeds" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="WebForm6.aspx.cs" Inherits="Final_Project.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="bread_nav">
        <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
            <li class="breadcrumb-item"><a href="seeds.aspx?cat=all">seeds</a></li>
            <li class="breadcrumb-item"><a href="seeds.aspx?cat=veg">Vegetable seeds</a></li>
            <li class="breadcrumb-item active" aria-current="page" id="current-page"></li>
        </ol>
    </nav>
    </div>
    <%--<asp:Repeater ID="d1" runat="server">
        <ItemTemplate>
           <img src="<%# Eval("seed_img") %>" />
       </ItemTemplate>
    </asp:Repeater>--%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="seed_id" OnItemDataBound="DataList1_ItemDataBound" DataSourceID="SqlDataSource1" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <div class="image">
                    <asp:Image ID="Image1" CssClass="img" runat="server" ImageUrl='<%# Eval("seed_img") %>' width="500" Height="650"/>
                </div>
                <div class="seedname">
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("seed_name") %>'  Font-Size="30px"></asp:Label>
                </div>
                <div class="seebrand">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("seed_brand") %>'  Font-Size="16px"></asp:Label><br />
                    <br>
                    <br></br>
                    <span style="color:black ;font-weight:bold; font-family: Arial, sans-serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal;  text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">₹</span>
                    <asp:Label ID="lblDisPrice" runat="server" Font-Size="20px" ForeColor="Black" Text='<%# Eval("dis_price") %>'></asp:Label>
                    &nbsp; 
                    <span style="color: rgb(77, 81, 86);font-weight:bold; font-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal;  text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">₹</span>
                    <asp:Label ID="lblOrgPrice" runat="server" Font-Strikeout="True" ForeColor="#908D9D" Text='<%# Eval("org_price") %>'></asp:Label>
                    <br />
                </div>
                <div class="percent">
                    <asp:Label ID="discount_percent" runat="server" Visible="false" ></asp:Label>
                </div>
                <div class="saved_price">
                    <asp:Label ID="lblDiscountAmount" runat="server" ></asp:Label>
                </div>
                <div class="inc_txs">
                    <asp:Label ID="taxes" runat="server" Text="Inclusive of all taxes"></asp:Label>
                </div><br />
                <div class="coup_img">
                    <img src="Images/coupon.jpg" />
                </div>
                <%--<div class="size_var">
                    <asp:Label ID="size_variant" runat="server" text="Size"></asp:Label>
                </div>--%>
                <div class="size_var">
                    <asp:Label ID="size_variant" runat="server" Text=""></asp:Label>
                </div>
                <div class="size_btn">
                    <asp:HiddenField ID="selectedSize" runat="server" />
                    <asp:Button ID="size1" CssClass="size1" runat="server" Text='<%# Eval("size") %>' OnClientClick="return validateButtonClick();"  OnClick="SizeButton_Click" CommandArgument='<%# Eval("size") %>'/>
                    <asp:Button ID="size2" CssClass="size2" runat="server" Text='<%# Eval("size2") %>' OnClientClick="return validateButtonClick();"  OnClick ="SizeButton_Click" CommandArgument='<%# Eval("size2") %>'/>
                    <asp:Button ID="size3" CssClass="size3" runat="server" Text='<%# Eval("size3") %>' OnClientClick="return validateButtonClick();"   OnClick="SizeButton_Click" CommandArgument='<%# Eval("size3") %>'/>
                </div>
                <div class="country">
                    <i class="fa-solid fa-globe"></i>
                    <h2>Country of Origin India</h2>
                </div>
                <div class="country">
                    <i class="fa-solid fa-shield"></i>
                    <h2>Secure Payments</h2>
                </div>
                <div class="qty">
                    <h2>Quantity</h2>
                    <asp:TextBox ID="TextBox1" text="1" CssClass="qtys"  runat="server" style="text-align:center" ForeColor="#E4D00A"></asp:TextBox>

                </div>
                <div class="order_btn">
                    <asp:Button ID="buy_now" CssClass="buynow" runat="server"  Text="Buy Now" />
                   <asp:Button ID="cart_now" CssClass="addcart" runat="server" Text="Add To Cart"  CommandArgument='<%# Eval("seed_name")%>' CommandName="addtocart" />
                    <asp:Label ID="lblMessage" runat="server" Visible="false" Text="test"></asp:Label>
                    <%--<asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label> <!-- To show the message -->--%>
                    <%--<asp:Button ID="cart_now" CssClass="addcart" runat="server" Text="Add To Cart"  OnClick="cart_now_Click" />--%>
                </div>
                       </script>      </ItemTemplate>
        </asp:DataList>

    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="DataList1" EventName="ItemCommand" />
    </Triggers>
</asp:UpdatePanel>
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
                    <li><a href="seeds.aspx">seeds</a></li>
                    <li><a href="seed_protection.aspx">seed Protection</a></li>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:major_projectConnectionString9 %>' SelectCommand="SELECT * FROM [seeds] WHERE (([seed_id] = @seed_id) AND ([seed_name] = @seed_name)  AND ([seed_brand] = @seed_brand))">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="seedid" DefaultValue="" Name="seed_id" Type="Int32"></asp:QueryStringParameter>
            <asp:QueryStringParameter QueryStringField="name" Name="seed_name" Type="String"></asp:QueryStringParameter>
            <%--<asp:QueryStringParameter QueryStringField="cat" Name="category" Type="String"></asp:QueryStringParameter>--%>
            <asp:QueryStringParameter QueryStringField="brand" Name="seed_brand" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>

<%--<asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1">
<ItemTemplate>
<div id="myModal" class="modal">
    <div class="modal-content">
        <div class="cartitem">
        <span class="close" onclick="closeModa1()">&times;</span>
            <i class="fa-solid fa-cart-shopping">
            </i>
            <asp:Label ID="cartqty" CssClass="cartqty" runat="server" Text="Cart"></asp:Label>
            <div class="short_img">
                    <asp:Image ID="shtimg" CssClass="shtimg" runat="server" ImageUrl='<%# Eval("seed_img") %>' width="30" Height="20"/>
             </div>
        </div>
    </div>
</div>
</ItemTemplate>
   </asp:DataList>
<div class="page-overlay"></div>
<!-- JavaScript to open modal -->
<script>
    function openModal() {
        document.getElementById("myModal").style.display = "block";
        document.body.classList.add("modal-open"); /* Add class to body to indicate modal is open */
        return false; /* Prevent the ASP.NET postback */
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
        document.body.classList.remove("modal-open"); /* Remove class to indicate modal is closed */
    }

    window.onclick = function (event) {
        var modal = document.getElementById("myModal");
        if (event.target == modal) {
            closeModal();
        }
    }

    document.getElementsByClassName("close")[0].onclick = function () {
        closeModal();
    }
</script>--%>
<%--<script>
    function validateButtonClick() {
        // Check if any of the first three buttons have been clicked
        if ($('#<%= size1.ClientID %>').hasClass('clicked') ||
            $('#<%= size2.ClientID %>').hasClass('clicked') ||
            $('#<%= size3.ClientID %>').hasClass('clicked')) {
            return true; // Allow the click on btn4
        } else {
            alert('Please click at least one of the first three buttons before clicking Button 4.');
            return false; // Prevent the click on btn4
        }
    }
</script>--%>

</asp:Content>
