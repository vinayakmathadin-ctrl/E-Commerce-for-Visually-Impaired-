using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Registration : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString);
    string type = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            language.Value =Request.QueryString["lang"];
            string sel;
            int i, count;
            SqlDataAdapter da;
            DataSet ds;

            sel = "SELECT TOP 1 Uid from [User] ORDER BY Uid DESC";
            da = new SqlDataAdapter(sel,conn);
            ds = new DataSet();
            da.Fill(ds);

            i = 101;
            count = ds.Tables[0].Rows.Count;
            if (count > 0)
            {
                i = Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString())+1;
            }
            else
            {
                i = 101;
            }
            uid.Text = i.ToString();
         
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PageLoad()", true);
        }
    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        string ins;
        if (TextBox2.Text != "" && TextBox3.Text != "" && TextBox4.Text != "" && TextBox5.Text != "" && TextBox6.Text != "" && TextBox7.Text != "")
        { 
            ins = "INSERT INTO [User] VALUES('"+ uid.Text+"','"+TextBox2.Text+"','"+TextBox3.Text+"','"+TextBox4.Text+"','"+TextBox5.Text+"','"+TextBox6.Text+"','"+TextBox7.Text+"')";
            SqlCommand cmd = new SqlCommand(ins,conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            Session["Uid"] = uid.Text;
            Session["registered"] = "success";
            Response.Redirect("Login.aspx?type=Registered&lang='"+language.Value+"'");
        }
       
    }
}