using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Final_Project
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Your code to initially bind the GridView
                BindGridView();
            }

            if (Session["addproduct"] != null && Session["addproduct"].ToString() == "true")
            {
                Session["addproduct"] = "false";
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("seed_name");
                dt.Columns.Add("seed_brand");
                dt.Columns.Add("seed_img");
                dt.Columns.Add("size");
                dt.Columns.Add("dis_price");
                dt.Columns.Add("org_price");
                dt.Columns.Add("quantity");
                dt.Columns.Add("total");


                if (Request.QueryString["seed_name"] != null && Request.QueryString["size"] != null)
                {
                    string selectedSize = Request.QueryString["size"];
                    if (Session["buyitems"] == null)
                    {
                        AddNewItemToDataTable(dt, selectedSize);
                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
                        bool itemExists = false;

                        foreach (DataRow row in dt.Rows)
                        {
                            if (row["seed_name"].ToString() == Request.QueryString["seed_name"] && row["size"].ToString() == selectedSize)
                            {
                                // Update quantity and total price
                                int quantity = Convert.ToInt32(row["quantity"]) + Convert.ToInt32(Request.QueryString["quantity"]);
                                row["quantity"] = quantity;
                                row["total"] = Convert.ToInt64(row["dis_price"]) * quantity;
                                itemExists = true;
                                break;
                            }
                        }

                        if (!itemExists)
                        {
                            AddNewItemToDataTable(dt, selectedSize);
                        }

                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                    }
                }
            }
            else
            {
                DataTable dt = (DataTable)Session["buyitems"];
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }

            // Calculate sum immediately
            CalculateAndDisplayTotal();
        }

        private void AddNewItemToDataTable(DataTable dt, string selectedSize)
        {
            DataRow dr = dt.NewRow();
            String mycon = @"Data Source=DESKTOP-PA4N9Q9\SQL2014;Initial Catalog=major_project;Integrated Security=True";
            SqlConnection scon = new SqlConnection(mycon);
            String myquery = "select * from seeds where seed_name=@seed_name";
            SqlCommand cmd = new SqlCommand(myquery, scon);
            cmd.Parameters.AddWithValue("@seed_name", Request.QueryString["seed_name"]);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);

            dr["sno"] = dt.Rows.Count + 1;
            dr["seed_name"] = ds.Tables[0].Rows[0]["seed_name"].ToString();
            dr["seed_brand"] = ds.Tables[0].Rows[0]["seed_brand"].ToString();
            dr["seed_img"] = ds.Tables[0].Rows[0]["seed_img"].ToString();
            dr["size"] = selectedSize;
            dr["dis_price"] = ds.Tables[0].Rows[0]["dis_price"].ToString();
            dr["org_price"] = ds.Tables[0].Rows[0]["org_price"].ToString();
            dr["quantity"] = Request.QueryString["quantity"];

            // Calculate total price with size multiplier
            Int64 price = Convert.ToInt64(ds.Tables[0].Rows[0]["dis_price"].ToString());
            Int64 quantity = Convert.ToInt64(Request.QueryString["quantity"].ToString());
            Int64 totalprice = price * quantity;

            // Apply size multiplier logic based on selectedSize
            if (selectedSize == "10 gms")
            {
                // No multiplier needed for 10 gms
            }
            else if (selectedSize == "100 gms(pack of 10 gms * 10)")
            {
                totalprice *= 10; // Multiply by 10 for 100 gms size
            }
            else if (selectedSize == "500 gms(pack of 100 gms * 5)")
            {
                totalprice *= 50; // Multiply by 50 for 500 gms size
            }

            dr["total"] = totalprice;

            dt.Rows.Add(dr);

            GridView1.DataSource = dt;
            GridView1.DataBind();

            Session["buyitems"] = dt;
        }


        private void BindGridView()
        {
            DataTable dt = Session["buyitems"] as DataTable;
            GridView1.DataSource = dt;
            GridView1.DataBind();

            // Calculate and display total price in footer
            CalculateAndDisplayTotal();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[5].Text = "₹" + e.Row.Cells[5].Text;
                // Assuming org_price is in the 7th column (index 6, zero-based)
                e.Row.Cells[6].Text = "₹" + e.Row.Cells[6].Text;
                // Assuming total is in the 9th column (index 8, zero-based)
                e.Row.Cells[8].Text = "₹" + e.Row.Cells[8].Text;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                CalculateAndDisplayTotal();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                DataTable dt = Session["buyitems"] as DataTable;
                dt.Rows.RemoveAt(rowIndex);

                GridView1.DataSource = dt;
                GridView1.DataBind();

                CalculateAndDisplayTotal();
            }
        }

        protected void CalculateAndDisplayTotal()
        {
            decimal grandTotal = 0;

            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    decimal rowTotal;
                    if (decimal.TryParse(row.Cells[8].Text.Replace("₹", ""), out rowTotal))
                    {
                        grandTotal += rowTotal;
                    }
                }
            }

            int secondLastColumnIndex = GridView1.Columns.Count - 2;

            if (GridView1.FooterRow != null)
            {
                TableCell cellTotalHeaderText = new TableCell();
                cellTotalHeaderText.Text = "Grand Total";
                GridView1.FooterRow.Cells.RemoveAt(secondLastColumnIndex - 1);
                GridView1.FooterRow.Cells[secondLastColumnIndex - 1].ColumnSpan = 2;
                GridView1.FooterRow.Cells.AddAt(secondLastColumnIndex - 1, cellTotalHeaderText);

                TableCell cellTotalValue = new TableCell();
                cellTotalValue.Text = "₹" + grandTotal.ToString();
                GridView1.FooterRow.Cells.RemoveAt(secondLastColumnIndex);
                GridView1.FooterRow.Cells.AddAt(secondLastColumnIndex, cellTotalValue);
            }
        }
    }
}
