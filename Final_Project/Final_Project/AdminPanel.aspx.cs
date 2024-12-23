using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace smsTwil
{
    public partial class OrderAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            string connectionString = "Your_Connection_String"; // Replace with your actual connection string

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Products (ProductName, ProductDescription, ProductCategory, ProductPrice) VALUES (@ProductName, @ProductDescription, @ProductCategory, @ProductPrice)", con);
                cmd.Parameters.AddWithValue("@ProductName", productName.Text.Trim());
                cmd.Parameters.AddWithValue("@ProductDescription", productDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@ProductCategory", productCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@ProductPrice", Convert.ToDecimal(productPrice.Text.Trim()));

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                ClearForm();
                BindGrid();
            }
        }

        private void BindGrid()
        {
            string connectionString = "Your_Connection_String"; // Replace with your actual connection string

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Products", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                con.Open();
                da.Fill(dt);
                con.Close();

                gvProducts.DataSource = dt;
                gvProducts.DataBind();
            }
        }

        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducts.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvProducts.Rows[e.RowIndex];
            int productId = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);
            string productName = ((TextBox)row.FindControl("txtProductName")).Text;
            string productDescription = ((TextBox)row.FindControl("txtProductDescription")).Text;
            string productCategory = ((DropDownList)row.FindControl("ddlProductCategory")).SelectedValue;
            decimal productPrice = Convert.ToDecimal(((TextBox)row.FindControl("txtProductPrice")).Text);

            UpdateProduct(productId, productName, productDescription, productCategory, productPrice);

            gvProducts.EditIndex = -1;
            BindGrid();
        }

        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;
            BindGrid();
        }

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int productId = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);
            DeleteProduct(productId);
            BindGrid();
        }

        private void UpdateProduct(int productId, string productName, string productDescription, string productCategory, decimal productPrice)
        {
            string connectionString = "Your_Connection_String"; // Replace with your actual connection string

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE Products SET ProductName = @ProductName, ProductDescription = @ProductDescription, ProductCategory = @ProductCategory, ProductPrice = @ProductPrice WHERE ProductId = @ProductId", con);
                cmd.Parameters.AddWithValue("@ProductName", productName);
                cmd.Parameters.AddWithValue("@ProductDescription", productDescription);
                cmd.Parameters.AddWithValue("@ProductCategory", productCategory);
                cmd.Parameters.AddWithValue("@ProductPrice", productPrice);
                cmd.Parameters.AddWithValue("@ProductId", productId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        private void DeleteProduct(int productId)
        {
            string connectionString = "Your_Connection_String"; // Replace with your actual connection string

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Products WHERE ProductId = @ProductId", con);
                cmd.Parameters.AddWithValue("@ProductId", productId);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        private void ClearForm()
        {
            productName.Text = string.Empty;
            productDescription.Text = string.Empty;
            productCategory.SelectedIndex = 0;
            productPrice.Text = string.Empty;
        }
    }
}
