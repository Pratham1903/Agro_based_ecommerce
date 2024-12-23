<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="crop_protection.aspx.cs" Inherits="Final_Project.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="head">
                <div class="description">
                    <asp:Label ID="descp" runat="server" Text="Crop Protection Products Online In India" />
                </div>
            </div>
            <div class="all_seeds">
                <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" DataSourceID="SqlDataSource2" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                   <div class="seeds_types">
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("crop_name") %>' />
                        <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("category") %>' />
                        <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Eval("crop_brand") %>' />
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("crop_img") %>' width="220px" Height="180px" CssClass="image_style" CommandName="view" CommandArgument='<%# Eval("crop_id") + "," + Eval("crop_name") + "," + Eval("crop_brand") + "," + Eval("category") %>' />
                        <br />
                        <div class="details">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("crop_name") %>' Font-Size="15px"></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("crop_brand") %>' Font-Size="12px" ForeColor="#908D9D"></asp:Label>
                            <br />
                            <br />
                            <span style="color: rgb(77, 81, 86);font-weight:bold; font-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">₹</span><asp:Label ID="Label3" runat="server" Text='<%# Eval("dis_price") %>' Font-Size="16px"></asp:Label>
                            &nbsp; <span style="color: rgb(77, 81, 86);font-weight:bold; font-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">₹</span><asp:Label ID="Label4" runat="server" Text='<%# Eval("org_price") %>' Font-Strikeout="True" ForeColor="#908D9D"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="no-expand" OnClick="openModal()">
                                <asp:ListItem Value="10 gms">40 ml</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <br />
                            <br />
                            <asp:Button ID="Button1" runat="server" BackColor="Red" Text="Buy Now" CommandName="view" CommandArgument='<%# Eval("crop_id") + "," + Eval("crop_name") + "," + Eval("crop_brand") + "," + Eval("category") %>'  />
                            <asp:Button ID="view" runat="server" Text="view details" CommandName="view" CommandArgument='<%# Eval("crop_id") + "," + Eval("crop_name") + "," + Eval("crop_brand") + "," + Eval("category") %>' />
                    </div>
                </ItemTemplate>
            </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:major_projectConnectionString6 %>' DeleteCommand="DELETE FROM [crop_protection] WHERE [crop_id] = @crop_id" InsertCommand="INSERT INTO [crop_protection] ([crop_id], [crop_img], [crop_brand], [crop_name], [dis_price], [org_price], [size], [category]) VALUES (@crop_id, @crop_img, @crop_brand, @crop_name, @dis_price, @org_price, @size, @category)" SelectCommand="SELECT * FROM [crop_protection]" UpdateCommand="UPDATE [crop_protection] SET [crop_img] = @crop_img, [crop_brand] = @crop_brand, [crop_name] = @crop_name, [dis_price] = @dis_price, [org_price] = @org_price, [size] = @size, [category] = @category WHERE [crop_id] = @crop_id">
                    <DeleteParameters>
                        <asp:Parameter Name="crop_id" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="crop_id" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="crop_img" Type="String"></asp:Parameter>
                        <asp:Parameter Name="crop_brand" Type="String"></asp:Parameter>
                        <asp:Parameter Name="crop_name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="dis_price" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="org_price" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="size" Type="String"></asp:Parameter>
                        <asp:Parameter Name="category" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="crop_img" Type="String"></asp:Parameter>
                        <asp:Parameter Name="crop_brand" Type="String"></asp:Parameter>
                        <asp:Parameter Name="crop_name" Type="String"></asp:Parameter>
                        <asp:Parameter Name="dis_price" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="org_price" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="size" Type="String"></asp:Parameter>
                        <asp:Parameter Name="category" Type="String"></asp:Parameter>
                        <asp:Parameter Name="crop_id" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:major_projectConnectionString7 %>' SelectCommand="SELECT * FROM [crop_protection] WHERE ([category] = @category)">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="cat" DefaultValue="cat" Name="category" Type="String"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <div class="all_seeds">
                <asp:DataList ID="DataList2" runat="server" OnEditCommand="DataList2_EditCommand" RepeatDirection="Horizontal" RepeatColumns="5" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" DataSourceID="SqlDataSource3">
                    <ItemTemplate>
                    <div class="seeds_types">
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("crop_name") %>' />
                        <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Eval("category") %>' />
                        <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Eval("crop_brand") %>' />
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("crop_img") %>' width="220px" Height="180px" CssClass="image_style" CommandName="view" CommandArgument='<%# Eval("crop_id") + "," + Eval("crop_name") + "," + Eval("crop_brand") + "," + Eval("category") %>' />
                        <br />
                        <div class="details">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("crop_name") %>' Font-Size="15px"></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("crop_brand") %>' Font-Size="12px" ForeColor="#908D9D"></asp:Label>
                            <br />
                            <br />
                            <span style="color: rgb(77, 81, 86);font-weight:bold; font-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">₹</span><asp:Label ID="Label3" runat="server" Text='<%# Eval("dis_price") %>' Font-Size="16px"></asp:Label>
                            &nbsp; <span style="color: rgb(77, 81, 86);font-weight:bold; font-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">₹</span><asp:Label ID="Label4" runat="server" Text='<%# Eval("org_price") %>' Font-Strikeout="True" ForeColor="#908D9D"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="no-expand" OnClick="openModal()">
                                <asp:ListItem Value="10 gms">80ml</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;
                            <br />
                            <br />
                            <asp:Button ID="Button1" runat="server" BackColor="Red" Text="Buy Now" CommandName="view" CommandArgument='<%# Eval("crop_id") + "," + Eval("crop_name") + "," + Eval("crop_brand") + "," + Eval("category") %>'  />
                            <asp:Button ID="view" runat="server" Text="view details" CommandName="view" CommandArgument='<%# Eval("crop_id") + "," + Eval("crop_name") + "," + Eval("crop_brand") + "," + Eval("category") %>' />
                    </div>
                </ItemTemplate>
            </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:major_projectConnectionString9 %>' SelectCommand="SELECT * FROM [crop_protection] WHERE ([all_category] = @all_category)">
                    <SelectParameters>
                        <asp:QueryStringParameter QueryStringField="cat" DefaultValue="cat" Name="all_category" Type="String"></asp:QueryStringParameter>
                    </SelectParameters>

                </asp:SqlDataSource>
            </div>


<asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource4">
<ItemTemplate>
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <div class="chose_size">
            <asp:Label ID="Label5" runat="server" Text="Choose A Size"></asp:Label>
        </div>
        <div class="size_details">
            <asp:Label ID="gms" CssClass="gms" runat="server" Text='<%# Eval("size") %>'></asp:Label><br /><br />
            <span style="color: rgb(77, 81, 86);font-weight:bold; font-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">₹</span>
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("dis_price") %>' Font-Size="16px"></asp:Label>
                            &nbsp; 
            <span style="color: rgb(77, 81, 86);font-weight:bold; font-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">₹</span>
            <asp:Label ID="Label4" runat="server" Text='<%# Eval("org_price") %>' Font-Strikeout="True" ForeColor="#908D9D"></asp:Label>
            <div class="offer">
                31% off
            </div>
            <div class="saved">
                Saved price ₹451
            </div>
             <div class="cartbtn">
                    <asp:Button ID="cart_now" CssClass="addcart" runat="server" Text="Add To Cart"  CommandArgument='<%# Eval("crop_name")%>' CommandName="addtocart" />
             </div>
        </div>
        <hr />
        <div class="size_details">
            <asp:Label ID="Label6" CssClass="gms" runat="server" Text='<%# Eval("size2") %>'></asp:Label><br /><br />
           <span style="color: rgb(77, 81, 86);font-weight:bold; font-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">₹</span>
            <asp:Label ID="Label7" runat="server" Text='<%# Eval("dis_price") %>' Font-Size="16px"></asp:Label>
              &nbsp; 
            <span style="color: rgb(77, 81, 86);font-weight:bold; font-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">₹</span>
            <asp:Label ID="Label8" runat="server" Text='<%# Eval("org_price") %>' Font-Strikeout="True" ForeColor="#908D9D"></asp:Label>
            <div class="offer">
                31% off
            </div>
            <div class="saved">
                Saved price ₹451
            </div>
             <div class="cartbtn">
                    <asp:Button ID="Button2" CssClass="addcart" runat="server" Text="Add To Cart" />
             </div>
        </div>
        <hr />
        <div class="size_details">
            <asp:Label ID="Label9" CssClass="gms" runat="server" Text='<%# Eval("size3") %>'></asp:Label><br /><br />
            <span style="color: rgb(77, 81, 86);font-weight:bold; font-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">₹</span>
            <asp:Label ID="Label10" runat="server" Text='<%# Eval("dis_price") %>' Font-Size="16px"></asp:Label>
              &nbsp; 
            <span style="color: rgb(77, 81, 86);font-weight:bold; font-family: Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">₹</span>
            <asp:Label ID="Label11" runat="server" Text='<%# Eval("org_price") %>' Font-Strikeout="True" ForeColor="#908D9D"></asp:Label>
            <div class="offer">
                31% off
            </div>
            <div class="saved">
                Saved price ₹451
            </div>
             <div class="cartbtn">
                    <asp:Button ID="Button3" CssClass="addcart" runat="server" Text="Add To Cart" />
             </div>
        </div>
    </div>
</div>
</ItemTemplate>
</asp:DataList>

<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString='<%$ ConnectionStrings:major_projectConnectionString9 %>' SelectCommand="SELECT * FROM [crop_protection]"></asp:SqlDataSource>




<div class="page-overlay"></div>
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
<!-- JavaScript to open modal -->
<script>

     function openModal() {
         document.getElementById("myModal").style.display = "block";
         document.body.classList.add("modal-open"); /* Add class to body to indicate modal is open */
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

     function closeModal() {
         document.getElementById("myModal").style.display = "none";
         document.body.classList.remove("modal-open"); /* Remove class to indicate modal is closed */
    }

    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
</asp:Content>
