using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class showcat : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                string category, Subcategory, uid, type, sel, text="", status;
                int count;
                SqlDataAdapter da;
                DataSet ds;

                category = Request.QueryString["category"];
                status = Request.QueryString["status"];
                uid = Request.QueryString["uid"];
                type = Request.QueryString["type"];
                Category.Text = category.ToString();
                this.uid.Value = uid;
                this.type.Value = type;
                this.Status.Value = status;

                sel = "SELECT DISTINCT SubCategory FROM Category where Category='" + category + "'";
                da = new SqlDataAdapter(sel, conn);
                ds = new DataSet();
                da.Fill(ds);
                count = ds.Tables[0].Rows.Count;
                if (count > 0)
                {
                    Count.Text = count.ToString();
                    text += "<table align='left' width='100%' id='category'> <tr>";
                    for (int i = 0; i < count; i++)
                    {
                        Subcategory = ds.Tables[0].Rows[i][0].ToString();
                        if ((i % 2) == 0)
                        {
                            text += "</tr>";
                            text += "<tr><td style='width:50%; height:100px; background-color:#3366FF; color:white; font-weight:bolder; font-size:xx-large; text-align:center' id='subcateory" + i + "'>";
                            text += Subcategory;
                            text += "</td>";
                            text += "<td width='2%'></td>";
                        }
                        else
                        {
                            text += "<td style='width:50%; height:100px; background-color:#3366FF; color:white; font-weight:bolder; font-size:xx-large; text-align:center' id='subcateory" + i + "'>";
                            text += Subcategory;
                            text += "</td>";
                            text += "<td width='2%'></td><tr><td><br></td></tr>";
                        }
                    }
                    text += "</tr></table>";
                    content.Text = text;
                    content.Visible = true;
                    conn.Close();
                    language.Value = Session["lang"].ToString();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PageLoad()", true);
                }
                conn.Close();
            }
        }
        catch (Exception ep)
        {
            Response.Redirect("UserLogin.aspx");
        }
    }
}