using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Collections.Specialized;
using System.IO;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;
using Twilio.Rest.Verify.V2.Service;


namespace Final_Project
{
    public partial class registeration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-PA4N9Q9\SQL2014;Initial Catalog=mini_project;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text;
            string email = TextBox2.Text;
            //string phoneNumber = TextBox3.Text;
            string password = TextBox4.Text;
            string confirmPassword = TextBox7.Text;

            //var accountSid = "AC24e0fbcdf0dc477ad817d4b4114bec1d";
            //var authToken = "dedee9a5c9fe06929453cfbca740daf3";
            //TwilioClient.Init(accountSid, authToken);
            //string phone = TextBox3.Text;

            //var verification = VerificationResource.Create(
            //    to: phone,
            //    channel: "sms",
            //    pathServiceSid: "VAc12e2118419c7bc82e2f4529aa346468"
            //);

            //Console.WriteLine(verification.Sid);

            if (password != confirmPassword)
            {

                Response.Write("<script>alert('Passwords do not match');</script>");
                return;

            }
            {
                SqlCommand cmd = new SqlCommand("insert into user_regi values(@i,@j,@k,@l)", con);
                con.Open();

                cmd.Parameters.AddWithValue("@i", TextBox1.Text);
                cmd.Parameters.AddWithValue("@j", TextBox2.Text);
                cmd.Parameters.AddWithValue("@k", TextBox3.Text);
                cmd.Parameters.AddWithValue("@l", TextBox4.Text);

                cmd.ExecuteNonQuery();

                con.Close();

                Response.Write("<script> alert('Registration successful ....')</script>");
                Response.Redirect("login.aspx");
            }
        }

        //protected void Button2_Click(object sender, EventArgs e)
        //{
        //    Panel1.Visible = false;
        //    Panel2.Visible = true;
        //    Random random = new Random();
        //    int value = random.Next(1001, 9999);
        //    string destinationaddr = "+91" + TextBox3.Text;
        //    string message = "Your Otp Number is " + value + "(Sent by Pratham Varkala)";
        //    string message1 = HttpUtility.UrlEncode(message);

        //    using (var wb = new WebClient())
        //    {
        //        byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
        //            {
        //            {"apikey", "NDU1ODY1NmY3MzZlNzkzNTU5NDYzMjY0NzE2ZjYyNzA=" },
        //            {"numbers", destinationaddr },
        //            {"message", message1 },
        //            {"sender", "KGIF" }
        //            });
        //        string result = System.Text.Encoding.UTF8.GetString(response);
        //        Session["otp"] = value;
        //    }
        //}
        //protected void Button3_Click(object sender, EventArgs e)
        //{
        //    if(TextBox5.Text == Session["otp"].ToString())
        //    {
        //        Panel2.Visible = false;
        //        Label1.Text = "Your mobile number has been verified successfully";
        //    }
        //    else
        //    {
        //        Label1.Text = "OTP number is incorrect";
        //        Panel2.Visible = true;
        //    }
        //}
    }
}