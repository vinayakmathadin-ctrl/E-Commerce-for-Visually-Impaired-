using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public partial class UserCart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

                string sel = "", text = "", pname, cost, pid;
                string uid = Request.QueryString["uid"];
                string type = Request.QueryString["type"];               
                string cart_detail = Request.QueryString["status"];
                string errstatus = Request.QueryString["errstatus"];
                this.Status.Value = errstatus;
                this.uid.Value = uid;
                this.type.Value = type.ToString();
                this.cart_detail.Value = cart_detail.ToString();
                SqlDataAdapter da;
                DataSet ds;
                int i, count, total_cost;

                sel = "select * from Cart where UID = '" + uid + "'";
                da = new SqlDataAdapter(sel,con);
                ds = new DataSet();
                da.Fill(ds);
                count = ds.Tables[0].Rows.Count;
                Count.Text = count.ToString();
                if(count > 0)
                {
                    total_cost = 0;
                    text += "<table class='table table-bordered product_list'><tbody>";
                    for(i = 0; i < count; i++)
                    {
                        pid = ds.Tables[0].Rows[i][0].ToString();
                        Session["Pid"] = pid;
                        pname = ds.Tables[0].Rows[i][1].ToString();
                        cost = ds.Tables[0].Rows[i][3].ToString();
                        total_cost = Convert.ToInt32(cost) + total_cost;
                        text += "<tr><td colspan ='2' class='hide' id='pid" + i + "'>" + pid +"</td></tr>";
                        text += "<tr><td width='70%'><h3  id='pname" + i + "'>" + pname + "</h3></td><td width='30%'><h3><span id='cost" + i + "'>" + cost + "</span>/-</h3></td></tr>";
                    }
                    text += "<tr><td width='70%'><h3>Total Cost</h3></td><td width='30%' ><h3><span id='total'>" + total_cost.ToString() + "</span>/-</h3></td></tr>";
                    text += "</tbody></table>";
                    Product.Text = text;
                    Product.Visible = true;
                    languages.Value = Session["lang"].ToString();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PageLoad()", true);
                }
                else
                {
                    Product.Text = "Currently, No products found in cart";
                    Product.Visible = true;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "NoData()", true);
                }
            }
        }
        catch (Exception ep)
        {
            Response.Redirect("UserLogin.aspx");
        }

    }
}