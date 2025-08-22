using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;  /* For Database Connection */
using System.Data;   /* For Data Adapter */
using System.Configuration;  /* For Include WP.config */

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /* SqlConnection con = new SqlConnection("data source=.; database=test; integrated security=SSPI");
         //SqlCommand cmd = new SqlCommand("SELECT * FROM [dbo].[first]", con);
         //con.Open();
         SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[first]", con);
         DataSet ds = new DataSet();
         da.Fill(ds);
        // SqlDataReader rdr = cmd.ExecuteReader();
         GridView1.DataSource = ds;
         GridView1.DataBind();
        // con.Close(); */

        string cs = ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
         SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [dbo].[first]", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}