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


namespace smsTwil
{
    public partial class WebForm1 : System.Web.UI.Page
    {
		string randomNumber;
		protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void Button1_Click(object sender, EventArgs e)
		{
			String result;
			string apiKey = "NzY1MTM2MzY2ODU4NzU0Yzc2NjM1NDM4N2E0OTczNTE=";
			string numbers = TextBox2.Text; // in a comma seperated list

			string send = "TSN";
			string name = TextBox1.Text;
			Random rnd = new Random();
			randomNumber = (rnd.Next(100000, 999999)).ToString();
			string message = "Hey" + name + "your OTP is " + randomNumber;


			//String url = "https://api.textlocal.in/send/?apikey=" + apiKey + "&numbers=" + numbers + "&message=" + message + "&sender=" + send;
			String url = $"https://api.textlocal.in/send/?apikey={apiKey}&numbers={numbers}&message={message}&sender={send}";
			//refer to parameters to complete correct url string

			StreamWriter myWriter = null;
			HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url);

			objRequest.Method = "POST";
			objRequest.ContentLength = Encoding.UTF8.GetByteCount(url);
			objRequest.ContentType = "application/x-www-form-urlencoded";
			try
			{
				myWriter = new StreamWriter(objRequest.GetRequestStream());
				myWriter.Write(url);
			}
			catch (Exception ex)
			{

				Msg.Text = ex.Message;

			}
			finally
			{
				myWriter.Close();
			}

			HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
			using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
			{
				result = sr.ReadToEnd();
				// Close and clean up the StreamReader
				sr.Close();
			}
			Msg.Text = "otp has been send.";

		}

		protected void Button2_Click(object sender, EventArgs e)
		{
			if (TextBox3.Text == randomNumber)
			{
				Msg.Text = "login successfully";
			}
			else
			{
				Msg.Text = "wrong otp";
			}
		}
	}
}