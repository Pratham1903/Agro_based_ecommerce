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
    public partial class testingotp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            Random random = new Random();
            int value = random.Next(1001, 9999);
            string destinationaddr = "+91" + TextBox1.Text;
            string message = "Your Otp Number is " + value + "(Sent by Pratham Varkala)";
            string message1 = HttpUtility.UrlEncode(message);

            using (var wb = new WebClient())
            {
                byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                    {
                    {"apikey", "NDU1ODY1NmY3MzZlNzkzNTU5NDYzMjY0NzE2ZjYyNzA=" },
                    {"numbers", destinationaddr },
                    {"message", message1 },
                    {"sender", "KGIF" }
                    });
                string result = System.Text.Encoding.UTF8.GetString(response);
                Session["otp"] = value;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox2.Text == Session["otp"].ToString())
            {
                Panel2.Visible = false;
                Label1.Text = "Your mobile number has been verified successfully";
            }
            else
            {
                Label1.Text = "OTP number is incorrect";
                Panel2.Visible = true;
            }
        }
    }
}