using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class HomeMain : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                string uid, type, login;
                uid = Request.QueryString["uid"];
                type = Request.QueryString["type"];
                login = Request.QueryString["status"];
                this.uid.Value = uid;
                this.type.Value = type;
                Login.Text = login.ToString();
                language.Value = Session["lang"].ToString();
                Session["lang"] = language.Value;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PageLoad()", true);
                conn.Close();
            }
        }
        catch(Exception ep)
        {
            Session["registered"] = "login";
            Response.Redirect("Login.aspx");
        }
    } 
}