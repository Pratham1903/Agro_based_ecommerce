using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;


namespace Final_Project
{
    public partial class dc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            var accountSid = "AC7969b7b3f25ed3a15a864746ba9d2b18";
            var authToken = "b29d5ea74c5949a3e94bfa447833fdb5";
            TwilioClient.Init(accountSid, authToken);

            var messageOptions = new CreateMessageOptions(
              new PhoneNumber(Mobile.Text));
            messageOptions.From = new PhoneNumber("+14156884240");
            DateTime myDate = DateTime.Today;
            messageOptions.Body = "Dear " + Name.Text + ",Your order has been confirmed placed on " + myDate.ToString() + "." + " To get more information log into KGIF website .";


            var message = MessageResource.Create(messageOptions);
            Console.WriteLine(message.Body);
            Response.Redirect("OrderConfirmed.html");
        }
    }
}