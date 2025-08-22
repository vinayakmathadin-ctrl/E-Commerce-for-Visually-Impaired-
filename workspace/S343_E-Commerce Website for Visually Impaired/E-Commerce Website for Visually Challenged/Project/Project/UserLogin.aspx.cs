using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class UserLogin : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString);
    string type = "";
    string uid = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            type = Request.QueryString["type"];

            string lang = Request.QueryString["language"];
            Session["lang"] = lang;


            this.Type.Value = type.ToString();
            //uid = Session["Uid"].ToString();
            //this.Uid.Value = uid.ToString();
            ////uid = Session["Uid"].ToString();

            if (type != null)
            {
                try
                {
                    if (type == "logout")
                    {
                        Response.Redirect("Login.aspx");
                    }
                    if (type == "forgot_password")
                    {
                        Response.Redirect("Login.aspx");
                    }
                    language.Value = Request.QueryString["lang"];
                    this.Page.ClientScript.RegisterStartupScript(GetType(), "CallMyFunction", "PageLoad()", true);
                }
                catch (Exception ex)
                {

                    language.Value = "English";
                    this.Page.ClientScript.RegisterStartupScript(GetType(), "CallMyFunction", "PageLoad()", true);

                }

            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Registration.aspx?type=register&lang='"+ Session["lang"] + "' ");
    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        string sel, uid, type;
        int count;
        SqlDataAdapter da;
        DataSet ds;

        if (TextBoxUsername.Text != "" && TextBoxPass.Text != "")
        {
           sel  = "SELECT * FROM [User] where username='" + TextBoxUsername.Text + "' and Password='" + TextBoxPass.Text + "'";
           da = new SqlDataAdapter(sel, conn);
           ds = new DataSet();
           da.Fill(ds);
           count = ds.Tables[0].Rows.Count;
            if (count > 0)
            {
                uid = TextBoxUsername.Text;
                Session["uid"] = ds.Tables[0].Rows[0][0].ToString();
                type = "User";
                Response.Redirect("HomeMain.aspx?status=login&uid="+ Session["uid"] + "&type="+ type +"");
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "error()", true);
            }
        }
    }
}