using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;

public partial class Payment : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                string uid, type, id, price, status;

                status = Request.QueryString["status"];
                uid = Request.QueryString["uid"];
                type = Request.QueryString["type"];
                id = Request.QueryString["Pid"];
                price = Request.QueryString["cost"];
                this.uid.Value = uid;
                this.type.Value = type;
                this.Status.Value = status;
                language.Value = Session["lang"].ToString();
                pid.Text = id.ToString();
               
                cost.Text = price;
                
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PageLoad()", true);
                
            }
             
}
        catch (Exception ep)
        {
            Response.Redirect("UserLogin.aspx");
        }

    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        //    string id = Request.QueryString["Pid"];
        //    string uid = Request.QueryString["uid"];
        //    SqlDataAdapter da;
        //    DataSet ds;
        //    string sel = "";
        //    string oid = "";

        //    sel = "select * from Product where Pid = '" + id + "'";
        //    da = new SqlDataAdapter(sel, con);
        //    ds = new DataSet();
        //    da.Fill(ds);
        //    int count = ds.Tables[0].Rows.Count;
        //    if (count > 0)
        //    {
        //        string pname = ds.Tables[0].Rows[0][1].ToString();
        //        string cost = ds.Tables[0].Rows[0][2].ToString();
        //        sel = "SELECT CAST(Oid AS int) AS Expr1 FROM Orders ORDER BY Expr1 desc";
        //        da = new SqlDataAdapter(sel, con);
        //        ds = new DataSet();
        //        da.Fill(ds);
        //        if (ds.Tables[0].Rows.Count == 0)
        //        {
        //            oid = "1";
        //        }
        //        else
        //        {
        //            string s = ds.Tables[0].Rows[0][0].ToString();
        //            int s1 = Convert.ToInt32(s) + 1;
        //            oid = s1.ToString();
        //        }
        //        string ins = "insert into orders(Oid,Productname,pid,qty,cost,uid,date,time,status) values('" + oid + "','" + pname + "','" + id + "','1','" + cost + "','" + uid + "','" + System.DateTime.Now.ToString("yyyy/MM/dd") + "','" + System.DateTime.Now.ToString("HH:mm") + "','Ordered')";
        //        SqlCommand cmd2 = new SqlCommand(ins, con);
        //        con.Open();
        //        cmd2.ExecuteNonQuery();
        //        con.Close();
        //        Response.Redirect("HomeMain.aspx?login=payment");
        //    }
    }

    protected void ButtonCancel_Click(object sender, EventArgs e)
    {
        //    Response.Redirect("HomeMain.aspx?login=cancel");
    }

}
