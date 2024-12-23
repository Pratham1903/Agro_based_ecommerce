using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Final_Project
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-PA4N9Q9\SQL2014;Initial Catalog=mini_project;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            string username = TextBoxUsername.Text;
            string password = TextBoxPassword.Text;
            SqlCommand cmd = new SqlCommand("select count (*) from user_regi where username=@i AND pass=@l", con);


            cmd.Parameters.AddWithValue("@i", username);
            cmd.Parameters.AddWithValue("@l", password);
            con.Open();
            int count = (int)cmd.ExecuteScalar();

            if (count > 0)
            {
                Label1.Text = "Login Sucefully";
                Label1.ForeColor = System.Drawing.Color.DarkMagenta;
                Session["Username"] = username;
                Response.Redirect("~/index.aspx");
            }
            else
            {
                Label1.Text = " failed login";
                Label1.ForeColor = System.Drawing.Color.Red;
            }

            con.Close();

        }
    }
}