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

public partial class Payment_Done : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString);
        string uid = Request.QueryString["uid"];
        string type = Request.QueryString["type"];
        string status = Request.QueryString["status"];
        string id = Request.QueryString["Pid"];
        
        SqlDataAdapter da;
        DataSet ds;
        SqlCommand cmd2;
        string sel = "";
        string oid = "";
        string pname = "";
        string cost = "";
        string ins = "";
        int count,i;
 
        if (status == "payment")
        {
            sel = "SELECT CAST(Oid AS int) AS Expr1 FROM Orders ORDER BY Expr1 desc";
            da = new SqlDataAdapter(sel, con);
            ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count == 0)
            {
                oid = "1";
            }
            else
            {
                string s = ds.Tables[0].Rows[0][0].ToString();
                int s1 = Convert.ToInt32(s) + 1;
                oid = s1.ToString();
            }

            if (id == "user_cart")
            {
                //string id1 = "";
                string name = "";
               // string cost1 = "";
               
                sel = "select * from Cart where UID = '" + uid + "'";
                da = new SqlDataAdapter(sel, con);
                ds = new DataSet();
                da.Fill(ds);
                count = ds.Tables[0].Rows.Count;
                if(count > 0)
                {
                    int total_cost = 0;
                    for (i = 0;i<count;i++)
                    {
                        string n = ds.Tables[0].Rows[i][1].ToString();
                        string c = ds.Tables[0].Rows[i][3].ToString();
                        // id1 += ("," + ds.Tables[0].Rows[i][0].ToString());
                        name += (", " + n + ": " + c + "");
                        total_cost = Convert.ToInt32(c) + total_cost;
                        
                         
                    }
                    //id1 = id1.Remove(0, 1);
                    name = name.Remove(0, 1);
                    //cost1 = cost1.Remove(0, 1);

                    //Response.Write(total_cost);
                    ins = "insert into orders(Oid,Productname,qty,cost,uid,date,time,status) values('" + oid + "','" + name + "','1','" + total_cost + "','" + uid + "','" + System.DateTime.Now.ToString("yyyy/MM/dd") + "','" + System.DateTime.Now.ToString("HH:mm") + "','Ordered')";

                    string del = "delete from Cart where UID = '" + uid + "'";

                    SqlCommand cmd3 = new SqlCommand(del, con);
                    con.Open();
                    cmd3.ExecuteNonQuery();
                    con.Close();
                }
            }
            else
            {
                sel = "select * from Product where Pid = '" + id + "' ";
                da = new SqlDataAdapter(sel, con);
                ds = new DataSet();
                da.Fill(ds);
                count = ds.Tables[0].Rows.Count;
                if (count > 0)
                {
                    pname = ds.Tables[0].Rows[0][1].ToString();
                    cost = ds.Tables[0].Rows[0][2].ToString();
                }
                ins = "insert into orders(Oid,Productname,qty,cost,uid,date,time,status) values('" + oid + "','" + pname + "','1','" + cost + "','" + uid + "','" + System.DateTime.Now.ToString("yyyy/MM/dd") + "','" + System.DateTime.Now.ToString("HH:mm") + "','Ordered')";
            }
            cmd2 = new SqlCommand(ins, con);
            con.Open();
            cmd2.ExecuteNonQuery();
            con.Close();
            Response.Redirect("HomeMain.aspx?status=order&uid=" + uid + "&type=" + type + "");

        }

        else if(status == "delete")
        {
            string del = "delete from Cart where UID = '" + uid + "' and PID = '"+ id +"'";

            SqlCommand cmd3 = new SqlCommand(del, con);
            con.Open();
            cmd3.ExecuteNonQuery();
            con.Close();
            Response.Redirect("UserCart.aspx?status=delete&uid=" + uid + "&type=" + type + "&errstatus=key");
        }

        else if(status == "cart_delete")
        {
            string del = "delete from Cart where UID = '" + uid + "'";

            SqlCommand cmd3 = new SqlCommand(del, con);
            con.Open();
            cmd3.ExecuteNonQuery();
            con.Close();
            Response.Redirect("UserLogin.aspx?type=logout");
        }

        else
        {
            string select = "select * from cart";
            SqlDataAdapter da1 = new SqlDataAdapter(select, con);
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);
            int count1 = ds1.Tables[0].Rows.Count;
            if (count1 < 11)
            {
                sel = "select * from Product p where Pid = '" + id + "' and NOT EXISTS(select Pid from Cart c where c.Pid = p.Pid)";
                da = new SqlDataAdapter(sel, con);
                ds = new DataSet();
                da.Fill(ds);
                count = ds.Tables[0].Rows.Count;
                if (count > 0)
                {
                    pname = ds.Tables[0].Rows[0][1].ToString();
                    cost = ds.Tables[0].Rows[0][2].ToString();
                    ins = "insert into Cart(PID,ProductName,Qty,Cost,TotCost,UID) values ('" + id + "','" + pname + "','1','" + cost + "','" + cost + "','" + uid + "')";
                    cmd2 = new SqlCommand(ins, con);
                    con.Open();
                    cmd2.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("ProductDetails.aspx?pid=" + id + "&status=addCart&uid=" + uid + "&type=" + type + "&key=");
                }
                else
                {
                    Response.Redirect("ProductDetails.aspx?pid=" + id + "&status=existInCart&uid=" + uid + "&type=" + type + "&key=");
                }
            }
            else
            {
                Response.Redirect("ProductDetails.aspx?pid=" + id + "&status=fullCart&uid=" + uid + "&type=" + type + "&key=");
            }
            
        }
    }
}