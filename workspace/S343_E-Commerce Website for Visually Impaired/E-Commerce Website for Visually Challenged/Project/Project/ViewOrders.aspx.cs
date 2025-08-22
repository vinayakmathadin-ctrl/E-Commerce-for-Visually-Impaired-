using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class ViewOrders : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString);
    string type = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        type = Request.QueryString["type"];
        if (type != "admin")
        {
            Response.Redirect("Login.aspx");
        }
        if (!IsPostBack)
        {
            string k = "";
            if (type == "admin")
            {
                k = "SELECT * FROM orders order by date desc";
            }
            //else if (Session["type"].ToString() == "User")
            //{
            //    k = "SELECT * FROM orders where uid='" + Session["Uid"].ToString() + "' order by date desc";
            //}
            SqlDataAdapter da = new SqlDataAdapter(k, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int c = ds.Tables[0].Rows.Count;
            if (c > 0)
            {
                GridView1.Visible = true;
                GridView1.DataSource = ds;
                GridView1.DataBind();
                LabelError.Visible = false;
            }
            else
            {
                GridView1.Visible = false;
                LabelError.Visible = true;
            }
        }
    }
}