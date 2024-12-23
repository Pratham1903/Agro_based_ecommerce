<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Final_Project.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="buttonsContainer" runat="server">
    <button type="button" id="btnBuyNow" class="btn btn-primary" runat="server">Buy Now</button>
    <button type="button" id="btnAddToCart" class="btn btn-secondary" runat="server" onclick="addToCart()">Add to Cart</button>
    <button type="button" id="btnGoToCart" class="btn btn-success" style="display:none;" runat="server">Go to Cart</button>
</div>
<script>
    function addToCart() {
        // Hide Add to Cart button
        document.getElementById('<%= btnAddToCart.ClientID %>').style.display = 'none';
        
        // Hide Buy Now button
        document.getElementById('<%= btnBuyNow.ClientID %>').style.display = 'none';
        
        // Show Go to Cart button
        document.getElementById('<%= btnGoToCart.ClientID %>').style.display = 'inline-block';
    }
</script>

        </div>
    </form>
</body>
</html>
