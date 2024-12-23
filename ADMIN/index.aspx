<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Final_Project.ADMIN.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
    <link rel="stylesheet" href="~/ADMIN/CSSFolders/index.css">
    <script src="https://kit.fontawesome.com/3ebac481c7.js" crossorigin="anonymous"></script>
</head>
<body>
   <form id="form1" runat="server">
        <div class="body">
            
        <div class="main_head">
            <div class="purpose"></div>
            <p class="admin_name">Super Admin</p>
            <a href=""><i class="fa-solid fa-bars fa-lg" id="menu_bars"></i></a>
        </div>
        <div class="vertical_navbar">
            <p class="super_user">Super Admin</p>
            <div class="menu_bars">
                <asp:Menu ID="Menu" runat="server">
                <Items>
                    <asp:MenuItem Text="Seeds" Value="Movies" NavigateUrl="~/ADMIN/movies_edit.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Crop Protection" Value="Show Timimgs" NavigateUrl="~/ADMIN/events_update.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Organic" Value="Home Page" NavigateUrl="~/ADMIN/plays.aspx"></asp:MenuItem>
                    <asp:MenuItem Text="Equipments" Value="Users" NavigateUrl="~/ADMIN/sports.aspx"></asp:MenuItem>
                    <%--<asp:MenuItem Text="Activities" Value="Booking" NavigateUrl="~/ADMIN/activities.aspx"></asp:MenuItem>--%>
                </Items>
                    <StaticHoverStyle BackColor="#95CADB" />
                    <StaticMenuItemStyle CssClass=" menu_list" ForeColor="White" />
                </asp:Menu>
                <div class="icons">
                    <i class="fa-solid fa-house" id="home"></i>
                </div>
                <div class="edit">
                    <i class="fa-solid fa-pen-to-square" id="edit"></i>
                </div>
                <div class="edit">
                    <i class="fa-solid fa-pen-to-square" id="edit"></i>
                </div>
                '<div class="edit1">
                    <i class="fa-solid fa-pen-to-square" id="edit"></i>
                </div>
                <div class="edit">
                    <i class="fa-solid fa-pen-to-square" id="edit"></i>
                </div>
                <div class="edit">
                    <i class="fa-solid fa-pen-to-square" id="edit"></i>
                </div>
                <div class="edit">
                    <i class="fa-solid fa-pen-to-square" id="edit"></i>
                </div>
                <div class="edit">
                    <i class="fa-solid fa-pen-to-square" id="edit"></i>
                </div>
            </div>
        </div>
       
        </div>
    </form>
</body>
</html>
