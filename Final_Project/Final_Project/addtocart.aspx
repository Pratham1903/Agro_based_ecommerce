<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="addtocart.aspx.cs" Inherits="Final_Project.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cartgired">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText="No particular products in shopping cart"
        ShowFooter="True" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">
        <Columns>
            <asp:BoundField HeaderText="Sr.No" DataField="sno">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="seed_name" HeaderText="Seed Name">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="seed_brand" HeaderText="Brand">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:ImageField DataImageUrlField="seed_img" HeaderText="Image">
                <ItemStyle HorizontalAlign="Center" />
            </asp:ImageField>
            <asp:BoundField DataField="size" HeaderText="Size">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="dis_price" HeaderText="Discount Price">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="org_price" HeaderText="Original Price">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="quantity" HeaderText="Quantity">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="total" HeaderText="Total">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:ButtonField CommandName="Remove" HeaderText="Remove" Text="Remove">
                <ItemStyle HorizontalAlign="Center" />
            </asp:ButtonField>
        </Columns>
    </asp:GridView>
</div>

    <asp:HyperLink ID="HyperLink1" CssClass="checkout" runat="server" NavigateUrl="~/delivery_confirmed.aspx">Checkout</asp:HyperLink>





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
</asp:Content>
