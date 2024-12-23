using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_Project
{
    public partial class WebForm3 : System.Web.UI.Page
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
        //    string seed_name = hiddenFieldname.Value;
        //    string category = hiddenFieldCategory.Value;
        //    string brand = hiddenFieldbrand.Value;

        //    string redirectUrl = GetRedirectUrl(seed_name, category, brand);
        //    Response.Redirect(redirectUrl);
        //}

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Button btn = (Button)sender;
        //    DataListItem item = (DataListItem)btn.NamingContainer;
        //    HiddenField hiddenFieldname = (HiddenField)item.FindControl("HiddenField1");
        //    HiddenField hiddenFieldCategory = (HiddenField)item.FindControl("HiddenField2");
        //    HiddenField hiddenFieldbrand = (HiddenField)item.FindControl("HiddenField3");

        //    string seed_name = hiddenFieldname.Value;
        //    string category = hiddenFieldCategory.Value;
        //    string brand = hiddenFieldbrand.Value;

        //    string redirectUrl = GetRedirectUrl(seed_name, category, brand);
        //    Response.Redirect(redirectUrl);
        //}


        //public string GetRedirectUrl(string seed_name, string category , string brand)
        //{
        //    string baseUrl = category.ToLower() == "veg" ? "vegetable_seeds_det.aspx" : "fruit_seeds_det.aspx";
        //    return $"{baseUrl}?type={category}&brand={brand}&name={seed_name}";
        //}

        protected void DataList2_EditCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                string[] args = e.CommandArgument.ToString().Split(',');
                if (args.Length == 4) // Assuming category is the fourth argument
                {
                    string seedId = args[0];
                    string seedName = args[1];
                    string seedBrand = args[2];
                    string category = args[3];

                    string url = string.Empty;

                    if (category.Equals("fru", StringComparison.OrdinalIgnoreCase))
                    {
                        url = string.Format("fruit_seeds_det.aspx?seedid={0}&name={1}&brand={2}",
                                            Uri.EscapeDataString(seedId),
                                            Uri.EscapeDataString(seedName),
                                            Uri.EscapeDataString(seedBrand));
                    }
                    else
                    {
                        url = string.Format("vegetable_seeds_det.aspx?seedid={0}&name={1}&brand={2}",
                                            Uri.EscapeDataString(seedId),
                                            Uri.EscapeDataString(seedName),
                                            Uri.EscapeDataString(seedBrand));
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
                    string seedId = args[0];
                    string seedName = args[1];
                    string seedBrand = args[2];
                    string category = args[3];

                    string url = string.Empty;

                    if (category.Equals("fru", StringComparison.OrdinalIgnoreCase))
                    {
                        url = string.Format("fruit_seeds_det.aspx?seedid={0}&name={1}&brand={2}",
                                            Uri.EscapeDataString(seedId),
                                            Uri.EscapeDataString(seedName),
                                            Uri.EscapeDataString(seedBrand));
                    }
                    else
                    {
                        url = string.Format("vegetable_seeds_det.aspx?seedid={0}&name={1}&brand={2}",
                                            Uri.EscapeDataString(seedId),
                                            Uri.EscapeDataString(seedName),
                                            Uri.EscapeDataString(seedBrand));
                    }

                    Response.Redirect(url);
                }
            }
        }
     
    }
}