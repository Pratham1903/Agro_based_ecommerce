<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Final_Project.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="carousel">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                 <ContentTemplate>
                    <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="sliders_index.xml" Width="1490px" />
                    <asp:Timer ID="Timer1" runat="server" Interval="5000"></asp:Timer>
                </ContentTemplate>
            </asp:UpdatePanel>
            </div>
            <div class="categories">
                <div class="heading">
                    <asp:Label ID="category" runat="server" Text="Categories" CssClass="category" Font-Size="30px"  ></asp:Label> 
                </div>
                <hr class="below_cat" />
                <div class="list_categories">
                    <asp:ImageButton ID="seeds" runat="server" ImageUrl="~/Images/categories/seeds.jpg" CssClass="seeds" PostBackUrl="~/seeds.aspx?cat=all" />
                    <asp:ImageButton ID="farm_machinery" runat="server" ImageUrl="~/Images/categories/farm_machinery.jpg"  CssClass="farm_machinery" PostBackUrl="~/equipments.aspx?cat=all"/>
                    <asp:ImageButton ID="pesticides" runat="server" ImageUrl="~/Images/categories/pesticides.jpg" CssClass="pesticides" PostBackUrl="~/crop_protection.aspx?cat=insect" />
                    <asp:ImageButton ID="organic_farming" runat="server" ImageUrl="~/Images/categories/organic_Farming.jpg"  CssClass="organic_farming" PostBackUrl="~/organic.aspx?cat=all"/>
                    <asp:ImageButton ID="nutrients" runat="server" ImageUrl="~/Images/categories/nutrients.jpg" CssClass="nutrients" PostBackUrl="~/crop_protection.aspx?cat=herbs"/>
                    <div class="category_name">
                        <asp:Label ID="seeds_label"  runat="server" Text="Seeds"  CssClass="seeds_label"/>
                        <asp:Label ID="farm_label"  runat="server" Text="Farm Machinery"  CssClass="farm_label"/>
                        <asp:Label ID="pest_label"  runat="server" Text="Insecticides"  CssClass="pest_label"/>
                        <asp:Label ID="organic_label"  runat="server" Text="Organic Farming"  CssClass="organic_label"/>
                        <asp:Label ID="nutrients_label"  runat="server" Text="Herbicides"  CssClass="nutrients_label"/>
                    </div>
                </div>
            </div>
            <div class="exclusive">
                <div class="heading">
                    <asp:Label ID="exclusive" runat="server" Text="Exclusive" CssClass="category" Font-Size="30px"  ></asp:Label> 
                </div>
                <hr class="below_exc" />
                <div class="list_exclusive">
                    <asp:ImageButton ID="bayer_products" runat="server" ImageUrl="~/Images/exclusive/bayer_products.jpg" />
                    <asp:ImageButton ID="farming_pro" runat="server" ImageUrl="~/Images/exclusive/farming_pro.jpg" />
                    <asp:ImageButton ID="fipronil" runat="server" ImageUrl="~/Images/exclusive/fipronil.jpg" />
                    <asp:ImageButton ID="red_chillies" runat="server" ImageUrl="~/Images/exclusive/red_chillies.jpg" />
                </div>
            </div>
            <div class="brand">
                <div class="heading">
                    <asp:Label ID="brand" runat="server" Text="Brands" CssClass="category" Font-Size="30px"  ></asp:Label> 
                </div>
                <hr class="below_brands" />
                <div class="list_brands">
                    <asp:ImageButton ID="brand1" runat="server" ImageUrl="~/Images/brands/brand1.jpg" CssClass="brand1" />
                    <asp:ImageButton ID="brand2" runat="server" ImageUrl="~/Images/brands/brand2.jpg" CssClass="brand2"/>
                    <%--<asp:ImageButton ID="brand3" runat="server" ImageUrl="~/Images/brands/brand3.jpg" />--%>
                    <asp:ImageButton ID="brand4" runat="server" ImageUrl="~/Images/brands/brand4.jpg" CssClass="brand4"/>
                    <asp:ImageButton ID="brand5" runat="server" ImageUrl="~/Images/brands/brand5.jpg" CssClass="brand5"/>
                    <asp:ImageButton ID="brand6" runat="server" ImageUrl="~/Images/brands/brand6.jpg" CssClass="brand6" />
                    <asp:ImageButton ID="brand7" runat="server" ImageUrl="~/Images/brands/brand7.jpg" CssClass="brand7"/>
                    <asp:ImageButton ID="brand8" runat="server" ImageUrl="~/Images/brands/brand8.jpg" CssClass="brand8"/>
                    <asp:ImageButton ID="brand9" runat="server" ImageUrl="~/Images/brands/brand9.jpg" CssClass="brand9"/>
                    
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
            <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:major_projectConnectionString5 %>' SelectCommand="SELECT * FROM [seeds] WHERE ([category] = @category)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="cat" DefaultValue="cat" Name="category" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>--%>

</asp:Content>
