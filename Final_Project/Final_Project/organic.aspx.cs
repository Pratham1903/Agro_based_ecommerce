using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_Project
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        //{
        //    ImageButton btn = (ImageButton)sender;
        //    DataListItem item = (DataListItem)btn.NamingContainer;
        //    HiddenField hiddenFieldname = (HiddenField)item.FindControl("HiddenField1");
        //    HiddenField hiddenFieldCategory = (HiddenField)item.FindControl("HiddenField2");
        //    HiddenField hiddenFieldbrand = (HiddenField)item.FindControl("HiddenField3");
        //    string org_name = hiddenFieldname.Value;
        //    string category = hiddenFieldCategory.Value;
        //    string brand = hiddenFieldbrand.Value;

        //    string redirectUrl = GetRedirectUrl(org_name, category, brand);
        //    Response.Redirect(redirectUrl);
        //}

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Button btn = (Button)sender;
        //    DataListItem item = (DataListItem)btn.NamingContainer;
        //    HiddenField hiddenFieldname = (HiddenField)item.FindControl("HiddenField1");
        //    HiddenField hiddenFieldCategory = (HiddenField)item.FindControl("HiddenField2");
        //    HiddenField hiddenFieldbrand = (HiddenField)item.FindControl("HiddenField3");

        //    string org_name = hiddenFieldname.Value;
        //    string category = hiddenFieldCategory.Value;
        //    string brand = hiddenFieldbrand.Value;

        //    string redirectUrl = GetRedirectUrl(org_name, category, brand);
        //    Response.Redirect(redirectUrl);
        //}
        //private string GetRedirectUrl(string org_name, string category, string brand)
        //{
        //    string baseUrl = category.ToLower() == "bio_insect" ? "bio_insecticides_org_det.aspx" : "bio_fungicides_org_det.aspx";
        //    return $"{baseUrl}?type={category}&brand={brand}&name={org_name}";
        //}

        protected void DataList2_EditCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                string[] args = e.CommandArgument.ToString().Split(',');
                if (args.Length == 4) // Assuming category is the fourth argument
                {
                    string orgId = args[0];
                    string orgName = args[1];
                    string orgBrand = args[2];
                    string category = args[3];

                    string url = string.Empty;

                    if (category.Equals("insect", StringComparison.OrdinalIgnoreCase))
                    {
                        url = string.Format("bio_insecticides_org_det.aspx?orgid={0}&name={1}&brand={2}",
                                            Uri.EscapeDataString(orgId),
                                            Uri.EscapeDataString(orgName),
                                            Uri.EscapeDataString(orgBrand));
                    }
                    else
                    {
                        url = string.Format("bio_fungicides_org_det.aspx?orgid={0}&name={1}&brand={2}",
                                            Uri.EscapeDataString(orgId),
                                            Uri.EscapeDataString(orgName),
                                            Uri.EscapeDataString(orgBrand));
                    }

                    Response.Redirect(url);
                }
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                string[] args = e.CommandArgument.ToString().Split(',');
                if (args.Length == 4) // Assuming category is the fourth argument
                {
                    string orgId = args[0];
                    string orgName = args[1];
                    string orgBrand = args[2];
                    string category = args[3];

                    string url = string.Empty;

                    if (category.Equals("insect", StringComparison.OrdinalIgnoreCase))
                    {
                        url = string.Format("bio_insecticides_org_det.aspx?orgid={0}&name={1}&brand={2}",
                                            Uri.EscapeDataString(orgId),
                                            Uri.EscapeDataString(orgName),
                                            Uri.EscapeDataString(orgBrand));
                    }
                    else
                    {
                        url = string.Format("bio_fungicides_org_det.aspx?orgid={0}&name={1}&brand={2}",
                                            Uri.EscapeDataString(orgId),
                                            Uri.EscapeDataString(orgName),
                                            Uri.EscapeDataString(orgBrand));
                    }

                    Response.Redirect(url);
                }
            }
        }
    }
}