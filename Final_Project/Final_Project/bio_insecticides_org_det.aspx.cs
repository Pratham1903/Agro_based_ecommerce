using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Globalization;
using System.Diagnostics;

namespace Final_Project
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["addproduct"] = "false";
                if (Session["Buyitems"] != null)
                {
                    DataTable dt = (DataTable)Session["Buyitems"];
                    if (dt != null)
                    {
                        int sr = dt.Rows.Count;
                        UpdateCartLabel(sr.ToString());
                    }
                }
                else
                {
                    UpdateCartLabel("0");
                }
            }
        }

        private void UpdateCartLabel(string text)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                Label lblCart = (Label)item.FindControl("Label3");
                if (lblCart != null)
                {
                    lblCart.Text = text;
                }
            }
        }

        protected void DataList1_ItemCommand(object sender, DataListCommandEventArgs e)
        {
            if (e.CommandName == "addtocart")
            {
                DataListItem item = e.Item;
                Label sizeVariantLabel = item.FindControl("size_variant") as Label;

                if (sizeVariantLabel != null && !string.IsNullOrEmpty(sizeVariantLabel.Text))
                {
                    string selectedSize = sizeVariantLabel.Text.Replace("Size: ", "");
                    TextBox txtbox = (TextBox)(e.Item.FindControl("Textbox1"));
                    Session["addproduct"] = "true";
                    Response.Redirect("addtocart.aspx?org_name=" + e.CommandArgument.ToString() + "&size=" + selectedSize + "&Quantity=" + txtbox.Text);
                }
                else
                {
                    // Show a message if size_variant label does not have text
                    Label lblMessage = item.FindControl("lblMessage") as Label;
                    if (lblMessage != null)
                    {
                        lblMessage.Text = "Please choose a size";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Visible = true;
                    }
                }
            }
            else
            {
                // Log or handle other command names if necessary
                Debug.WriteLine("CommandName: " + e.CommandName);
            }
        }




        protected void rptrProductDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // Your event handling logic here
        }
        protected void SizeButton_Click(object sender, EventArgs e)
        {
            Button clickedButton = sender as Button;
            if (clickedButton != null)
            {
                // Find the DataListItem that contains the clicked button
                DataListItem item = clickedButton.NamingContainer as DataListItem;
                if (item != null)
                {
                    // Find the size_variant label in the same DataListItem
                    Label sizeVariantLabel = item.FindControl("size_variant") as Label;
                    if (sizeVariantLabel != null)
                    {
                        // Update the text of the size_variant label to match the button's text
                        sizeVariantLabel.Text = "Size: " + clickedButton.CommandArgument;
                    }
                    else
                    {
                        Debug.WriteLine("size_variant label not found.");
                    }

                    // Find and update the prices
                    Label lblDisPrice = item.FindControl("lblDisPrice") as Label;
                    Label lblOrgPrice = item.FindControl("lblOrgPrice") as Label;

                    if (lblDisPrice != null && lblOrgPrice != null)
                    {
                        // Check if the prices are already adjusted
                        if (Session["OriginalPrices_" + item.ItemIndex] == null)
                        {
                            // Store original prices in session for this item
                            decimal originalDisPrice = Convert.ToDecimal(lblDisPrice.Text);
                            decimal originalOrgPrice = Convert.ToDecimal(lblOrgPrice.Text);

                            Session["OriginalPrices_" + item.ItemIndex] = new Tuple<decimal, decimal>(originalDisPrice, originalOrgPrice);
                        }

                        // Retrieve original prices from session
                        Tuple<decimal, decimal> originalPrices = Session["OriginalPrices_" + item.ItemIndex] as Tuple<decimal, decimal>;
                        decimal disPrice = originalPrices.Item1;
                        decimal orgPrice = originalPrices.Item2;

                        // Apply size multiplier logic based on selectedSize
                        if (clickedButton.CommandArgument == "100 ml")
                        {
                            // No multiplier needed for 10 gms
                        }
                        else if (clickedButton.CommandArgument == "200 ml")
                        {
                            disPrice *= 2; // Multiply by 10 for 100 gms size
                            orgPrice *= 2; // Multiply by 10 for 100 gms size
                        }
                        else if (clickedButton.CommandArgument == "500 ml")
                        {
                            disPrice *= 5; // Multiply by 50 for 500 gms size
                            orgPrice *= 5; // Multiply by 50 for 500 gms size
                        }

                        // Update the labels with formatted prices
                        lblDisPrice.Text = disPrice.ToString("F2");
                        lblOrgPrice.Text = orgPrice.ToString("F2");

                        // Calculate discount amount and percentage
                        decimal difference = orgPrice - disPrice;
                        decimal discountPercentage = (difference / orgPrice) * 100;

                        // Find and update discount labels
                        Label lblDiscountAmount = item.FindControl("lblDiscountAmount") as Label;
                        Label discount_percent = item.FindControl("discount_percent") as Label;

                        if (lblDiscountAmount != null)
                        {
                            lblDiscountAmount.Text = "saved price: ₹" + difference.ToString("F2");
                        }

                        if (discount_percent != null)
                        {
                            discount_percent.Text = $"{discountPercentage.ToString("F0")}% off";
                        }

                        // Update the UpdatePanel to reflect the changes
                        UpdatePanel updatePanel = item.FindControl("UpdatePanel1") as UpdatePanel;
                        if (updatePanel != null)
                        {
                            updatePanel.Update();
                        }
                        else
                        {
                            Debug.WriteLine("UpdatePanel not found.");
                        }
                    }
                }
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblDisPrice = (Label)e.Item.FindControl("lblDisPrice");
                Label lblOrgPrice = (Label)e.Item.FindControl("lblOrgPrice");
                Label lblDiscountAmount = (Label)e.Item.FindControl("lblDiscountAmount");
                Label discount_percent = (Label)e.Item.FindControl("discount_percent");

                if (lblDisPrice != null && lblOrgPrice != null && lblDiscountAmount != null)
                {
                    // Ensure the Text properties are trimmed and in the correct format
                    string disPriceText = lblDisPrice.Text.Trim();
                    string orgPriceText = lblOrgPrice.Text.Trim();

                    decimal disPrice, orgPrice;

                    CultureInfo culture = CultureInfo.InvariantCulture;

                    if (decimal.TryParse(disPriceText, NumberStyles.Number, culture, out disPrice) &&
                        decimal.TryParse(orgPriceText, NumberStyles.Number, culture, out orgPrice))
                    {
                        decimal difference = orgPrice - disPrice;
                        decimal discountPercentage = (difference / orgPrice) * 100;
                        lblDiscountAmount.Text = "saved price: ₹" + difference.ToString("F2", culture); // Format to 2 decimal places
                        discount_percent.Text = $"{discountPercentage.ToString("F0", culture)}% off";
                    }
                    else
                    {
                        lblDiscountAmount.Text = "Invalid price format";
                    }
                }
            }
        }



    }
}