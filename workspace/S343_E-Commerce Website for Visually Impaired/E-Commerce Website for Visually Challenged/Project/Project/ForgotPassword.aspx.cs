using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class ForgotPassword : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                language.Value = Session["lang"].ToString();
                language1.Value = Session["lang"].ToString();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PageLoad()", true);
            }
        }
        catch(Exception ep)
        {
            Response.Redirect("UserLogin.aspx");
        }
    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        string sel, uid, type;
        int count;
        SqlDataAdapter da;
        DataSet ds;

        if (userid.Text != "" && emailid.Text != "")
        {
            sel = "SELECT * FROM [User] where Uid='" + userid.Text + "'";
            da = new SqlDataAdapter(sel, conn);
            ds = new DataSet();
            da.Fill(ds);
            count = ds.Tables[0].Rows.Count;
            
            if (count > 0)
            {
                string email = ds.Tables[0].Rows[0][2].ToString();
                if (emailid.Text == email)
                {
                    verification.Visible = false;
                    forgot_password.Visible = true;
                    language.Value = Session["lang"].ToString();
                    language1.Value = Session["lang"].ToString();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "verification()", true);
                }
                else
                {
                    language.Value = Session["lang"].ToString();
                    language1.Value = Session["lang"].ToString();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "emailverification()", true);
                }
            }
            else
            {
                language.Value = Session["lang"].ToString();
                language1.Value = Session["lang"].ToString();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "error()", true);
            }
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        string uid = userid.Text;
        string upd = "UPDATE [dbo].[User] SET [Password]='" + TextBox1.Text+"' where [Uid]  = '"+ uid + "'";
        SqlCommand cmd = new SqlCommand(upd, conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("UserLogin.aspx?type=forgot_password");

    }
}