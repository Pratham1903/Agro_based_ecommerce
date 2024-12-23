using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Final_Project
{
    public partial class WebForm2 : System.Web.UI.Page
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
        //    string crop_name = hiddenFieldname.Value;
        //    string category = hiddenFieldCategory.Value;
        //    string brand = hiddenFieldbrand.Value;

        //    string redirectUrl = GetRedirectUrl(crop_name, category, brand);
        //    Response.Redirect(redirectUrl);
        //}

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Button btn = (Button)sender;
        //    DataListItem item = (DataListItem)btn.NamingContainer;
        //    HiddenField hiddenFieldname = (HiddenField)item.FindControl("HiddenField1");
        //    HiddenField hiddenFieldCategory = (HiddenField)item.FindControl("HiddenField2");
        //    HiddenField hiddenFieldbrand = (HiddenField)item.FindControl("HiddenField3");

        //    string crop_name = hiddenFieldname.Value;
        //    string category = hiddenFieldCategory.Value;
        //    string brand = hiddenFieldbrand.Value;

        //    string redirectUrl = GetRedirectUrl(crop_name, category, brand);
        //    Response.Redirect(redirectUrl);
        //}


        //private string GetRedirectUrl(string crop_name, string category, string brand)
        //{
        //    string baseUrl = category.ToLower() == "insect" ? "insecticides_crop_det.aspx" : "herbicides_crop_det.aspx";
        //    return $"{baseUrl}?type={category}&brand={brand}&name={crop_name}";
        //}

        protected void DataList2_EditCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                string[] args = e.CommandArgument.ToString().Split(',');
                if (args.Length == 4) // Assuming category is the fourth argument
                {
                    string cropId = args[0];
                    string cropName = args[1];
                    string cropBrand = args[2];
                    string category = args[3];

                    string url = string.Empty;

                    if (category.Equals("insect", StringComparison.OrdinalIgnoreCase))
                    {
                        url = string.Format("insect_crops_det.aspx?cropid={0}&name={1}&brand={2}",
                                            Uri.EscapeDataString(cropId),
                                            Uri.EscapeDataString(cropName),
                                            Uri.EscapeDataString(cropBrand));
                    }
                    else
                    {
                        url = string.Format("herbs_crops_det.aspx?cropid={0}&name={1}&brand={2}",
                                            Uri.EscapeDataString(cropId),
                                            Uri.EscapeDataString(cropName),
                                            Uri.EscapeDataString(cropBrand));
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
                    string cropId = args[0];
                    string cropName = args[1];
                    string cropBrand = args[2];
                    string category = args[3];

                    string url = string.Empty;

                    if (category.Equals("insect", StringComparison.OrdinalIgnoreCase))
                    {
                        url = string.Format("insect_crop_det.aspx?cropid={0}&name={1}&brand={2}",
                                            Uri.EscapeDataString(cropId),
                                            Uri.EscapeDataString(cropName),
                                            Uri.EscapeDataString(cropBrand));
                    }
                    else
                    {
                        url = string.Format("herbs_crop_det.aspx?cropid={0}&name={1}&brand={2}",
                                            Uri.EscapeDataString(cropId),
                                            Uri.EscapeDataString(cropName),
                                            Uri.EscapeDataString(cropBrand));
                    }

                    Response.Redirect(url);
                }
            }
        }
    }
}