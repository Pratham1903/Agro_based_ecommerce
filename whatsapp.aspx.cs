using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace FinalProject
{
    public partial class whatsapp : System.Web.UI.Page
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
              new PhoneNumber("whatsapp:+917779837721"));
            messageOptions.From = new PhoneNumber("whatsapp:+14155238886");
            messageOptions.Body = Name.Text + " has a query : "+ Msg.Text;


            var message = MessageResource.Create(messageOptions);
            Console.WriteLine(message.Body);
        }
    }
}