using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewProduct : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                string category, Subcategory, uid, type, sel, text = "", id, name, price, status;
                int count,i;
                SqlDataAdapter da;
                DataSet ds;

                category = Request.QueryString["category"];
                status = Request.QueryString["status"];
                uid = Request.QueryString["uid"];
                type = Request.QueryString["type"];
                Subcategory = Request.QueryString["SubCategory"];
                LabelSubCategory.Text = Subcategory.ToString();
                LabelCategory.Text = category.ToString();
                this.Status.Value = status;
                this.uid.Value = uid;
                this.type.Value = type;

                sel = "SELECT * FROM Product where Category='" + LabelCategory.Text + "' and SubCategory = '" + LabelSubCategory.Text + "'";
                da = new SqlDataAdapter(sel, conn);
                ds = new DataSet();
                da.Fill(ds);
                count = ds.Tables[0].Rows.Count;
                if (count > 0)
                {
                    Count.Text = count.ToString();
                    text += "<center><div class='container'><div class='row'>";
                    for (i = 0; i < count; i++)
                    {
                        id = ds.Tables[0].Rows[i][0].ToString();
                        name = ds.Tables[0].Rows[i][1].ToString();
                        price = ds.Tables[0].Rows[i][2].ToString();
                        text += "<div class='shadow-lg p-3 mb-5 bg-white rounded col-md-3' id='product'>";
                        text += "<img src ='images/box.png'><br/><br/>";
                        text += "<h3 id='id" + i + "' class='hide'>" + id + "</h3>";
                        text += "<h3 id='product_name" + i + "'>" + name + "</h3>";
                        text += "<h4 > Price : <span style='font-weight:initial;' id='price" + i + "'>" + price + "/-</span></h4>";
                        text += "</div>";
                        text += "<div class='col-md-1'></div>";
                    }
                    text += "</div></div></center>";
                    content.Text = text;
                    content.Visible = true;
                    conn.Close();
                    language.Value = Session["lang"].ToString();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PageLoad()", true);
                }
                else
                {
                    language.Value = Session["lang"].ToString();

                    content.Text = "<h1><center>Currently, No products found for this category</center></h1>";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "NoData()", true);
                }

            }
        }
        catch
        {
            Response.Redirect("UserLogin.aspx");
        }

    }
}