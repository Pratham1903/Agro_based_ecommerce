<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="smsTwil.AdminPanel" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agriculture Product Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }

        .page-title {
            font-size: 24px;
            margin: 0;
        }

        .form-container {
            margin-top: 20px;
            padding: 20px;
            background-color: #f0f0f0;
            border-radius: 8px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-group textarea {
            height: 100px;
        }

        .form-group select {
            padding: 10px 5px;
        }

        .btn-primary {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-primary:hover {
            background-color: #45a049;
        }

        .table-container {
            margin-top: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th,
        .table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .table th {
            background-color: #f2f2f2;
        }

        .table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1 class="page-title">Agriculture Product Admin Panel</h1>
            </div>

            <div class="form-container">
                <div class="form-group">
                    <label for="productName">Product Name</label>
                    <asp:TextBox ID="productName" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <label for="productDescription">Description</label>
                    <asp:TextBox ID="productDescription" runat="server" TextMode="MultiLine" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <label for="productCategory">Category</label>
                    <asp:DropDownList ID="productCategory" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select category..." Value="" />
                        <asp:ListItem Text="Seeds" Value="Seeds" />
                        <asp:ListItem Text="Fertilizers" Value="Fertilizers" />
                        <asp:ListItem Text="Pesticides" Value="Pesticides" />
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="productPrice">Price</label>
                    <asp:TextBox ID="productPrice" runat="server" CssClass="form-control" />
                </div>

                <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" CssClass="btn-primary"
                    OnClick="btnAddProduct_Click" />
            </div>

            <div class="table-container">
                <asp:GridView ID="gvProducts" runat="server" CssClass="table" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="ProductId" HeaderText="ID" />
                        <asp:BoundField DataField="ProductName" HeaderText="Name" />
                        <asp:BoundField DataField="ProductDescription" HeaderText="Description" />
                        <asp:BoundField DataField="ProductCategory" HeaderText="Category" />
                        <asp:BoundField DataField="ProductPrice" HeaderText="Price" DataFormatString="{0:C}" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn-edit"
                                    CommandName="Edit" CommandArgument='<%# Eval("ProductId") %>' />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn-delete"
                                    CommandName="Delete" CommandArgument='<%# Eval("ProductId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>

</html>

