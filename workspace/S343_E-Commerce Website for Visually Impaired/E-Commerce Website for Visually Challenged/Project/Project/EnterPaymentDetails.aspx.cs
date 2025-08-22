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

public partial class EnterPaymentDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString);
    string  pid;
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string uid, type1;

            uid = Request.QueryString["uid"];
            Session["uid"] = uid;
            type1 = Request.QueryString["type"];
            pid = Request.QueryString["Pid"];
            Session["pid"] = pid;
            language.Value= Session["lang"].ToString();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PageLoad()", true);
        }
    }

    protected void ButtonPay_Click(object sender, EventArgs e)
    {
      string uid =Session["uid"].ToString();
        pid = Session["pid"].ToString();
        if (pid == "user_cart")
        {
            
            string name = "";
            // string cost1 = "";

            string sel = "select * from Cart where UID in (select uid from [user] where username='"+uid+"')";
            SqlDataAdapter sda = new SqlDataAdapter(sel, con);
            DataSet ds1 = new DataSet();
            sda.Fill(ds1);
            int count = ds1.Tables[0].Rows.Count;
            if (count > 0)
            {
                int total_cost = 0;
                for (int i = 0; i < count; i++)
                {
                    id = ds1.Tables[0].Rows[i][0].ToString();
                    string n = ds1.Tables[0].Rows[i][1].ToString();
                    string c = ds1.Tables[0].Rows[i][3].ToString();
                    // id1 += ("," + ds.Tables[0].Rows[i][0].ToString());
                    // name += (", " + n + ": " + c + "");
                    name = n;
                    total_cost = Convert.ToInt32(c) + total_cost;

                   // name = name.Remove(0, 1);
                
                    string ins = "Insert into PaymentDetails values('" + uid + "','" + id + "','" + txtCardNo.Text + "','" + txtCVV.Text + "','" + txtbankName.Text + "','" + txtBranch.Text + "','" + name + "')";
                    con.Open();
                    SqlCommand cmd3 = new SqlCommand(ins, con);
                    cmd3.ExecuteNonQuery();
                    con.Close();
                }
                //id1 = id1.Remove(0, 1);
                con.Open();
                string del = "delete from Cart where UID = '" + uid + "'";
                SqlCommand cmdd = new SqlCommand(del, con);                
                cmdd.ExecuteNonQuery();
                
                con.Close();
            }
        }
        else
        {
            con.Open();
            string qu = " select ProductName from Product where Pid='" + pid + "' ";
            SqlDataAdapter da = new SqlDataAdapter(qu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            string pname = ds.Tables[0].Rows[0][0].ToString();

            string q = "Insert into PaymentDetails values('" + uid + "','" + pid + "','" + txtCardNo.Text + "','" + txtCVV.Text + "','" + txtbankName.Text + "','" + txtBranch.Text + "','" + pname + "')";
            SqlCommand cmd = new SqlCommand(q, con);
            cmd.ExecuteNonQuery();

        }
        Response.Redirect("PaymentSuccess.aspx?type=user");
    }
}