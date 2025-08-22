using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonUpload_Click(object sender, EventArgs e)
    {
        String image, path;
        try
        {
            image = FileUpload1.FileName;
            path = Server.MapPath("~\\images\\");
            FileUpload1.SaveAs(path + image);
            Image1.ImageUrl = "images\\" + image;
            Image1.Visible = true;
        }
        catch (Exception ep)
        {
            string error = ep.ToString();
            Page.ClientScript.RegisterStartupScript(GetType(), "msgbox", "alert('Kindly upload a photo');", true);
            Image1.Visible = false;
        }
    }

}