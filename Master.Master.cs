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
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                //Label1.Text = "Hello Guest,";
                Label1.Visible = false;
                LinkButton2.Visible = true;
                LinkButton1.Visible = false;
                btnExample.Attributes["class"] = "bootcart";
            }
            else
            {
                Label1.Text =Session["username"].ToString();
                LinkButton1.Visible = true;
                LinkButton2.Visible = false;
                btnExample.Attributes["class"] = "bootcartin";

            }
            Session["addproduct"] = "false";
            if (Session["Buyitems"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["buyitems"];
                int sr;
                sr = dt.Rows.Count;
                Label3.Text = sr.ToString();
            }
            //DataTable dt = new DataTable();
            //dt = (DataTable)Session["buyitems"];
            //if (dt != null)
            //{

            //    Label2.Text = dt.Rows.Count.ToString();
            //}
            //else
            //{
            //    Label2.Text = "0";

            //}

            //if (!IsPostBack)
            //{
            //    ddlWelcomeOptions.SelectedValue = "0"; // Set default selection
            //    UpdateWelcomeMessage();
            //}

            // lblAddToCart is always visible

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/index.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("addtocart.aspx");
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {

        }
        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    if (txtSearch.Text != "")
        //    {
        //        datali
        //    }
        //}

        //public TextBox TxtSearch
        //{
        //    get { return txtSearch;  }
        //}
        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    string searchText = txtSearch.Text;
        //    // Implement search logic here, for example:
        //    // Response.Redirect("SearchResults.aspx?query=" + Server.UrlEncode(searchText));
        //    //Response.Write("Search text: " + searchText);
        //    if (searchText =="crop" )
        //    {
        //        Response.Redirect("crop_protection.aspx");
        //    }
        //}

        //protected void ddlWelcomeOptions_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (ddlWelcomeOptions.SelectedValue == "2") // Logout option
        //    {
        //        Session["Username"] = null;
        //        Response.Redirect("~/index.aspx"); // Redirect to logout page or desired page
        //    }
        //    else
        //    {
        //        // Handle other options if needed
        //    }
        //}

        //protected void btnLogin_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("~/login.aspx");
        //}

        //protected void UpdateWelcomeMessage()
        //{
        //    if (Session["Username"] != null)
        //    {
        //        lblUsername.Text =Session["Username"].ToString();
        //        lblUsername.Visible = true;
        //        ddlWelcomeOptions.Visible = true;
        //        btnLogin.Visible = false;
        //    }
        //    else
        //    {
        //        lblUsername.Visible = false;
        //        ddlWelcomeOptions.Visible = false;
        //        btnLogin.Visible = true;
        //    }
        //}

        //protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        //{
        //    // Redirect to another page within the same project
        //    Response.Redirect("~/RedirectPage.aspx");

        //    // Redirect to another localhost project
        //    // Response.Redirect("http://localhost:port/otherproject/page.aspx");
        //}


    }
}