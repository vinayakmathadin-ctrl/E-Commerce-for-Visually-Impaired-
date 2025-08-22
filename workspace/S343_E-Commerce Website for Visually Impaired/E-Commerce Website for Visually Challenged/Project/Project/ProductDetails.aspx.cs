using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class ProductDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                string category, subcategory,uid, type, sel, text = "", id, name, cost, status, description, key;
                int count, i;
                SqlDataAdapter da;
                DataSet ds;

                id = Request.QueryString["Pid"];
                status = Request.QueryString["status"];
                uid = Request.QueryString["uid"];
                type = Request.QueryString["type"];
                key = Request.QueryString["key"];
                pid.Text = id;
                Status.Text = status.ToString();
                this.uid.Value = uid;
                this.type.Value = type;
                this.key.Value = key;

                sel = "select * from Product where Pid = '" + id + "'";
                da = new SqlDataAdapter(sel, con);
                ds = new DataSet();
                da.Fill(ds);
                count = ds.Tables[0].Rows.Count;
                if (count > 0)
                {
                    name = ds.Tables[0].Rows[0][1].ToString();
                    cost = ds.Tables[0].Rows[0][2].ToString();
                    category = ds.Tables[0].Rows[0][3].ToString();
                    subcategory = ds.Tables[0].Rows[0][4].ToString();
                    this.category.Value = category;
                    this.subcategory.Value = subcategory;
                    description = ds.Tables[0].Rows[0][5].ToString();

                    text += "<div class='row' style='background - color:#c0c0c0;'>";
                    text += "<div class='col-lg-2'></div>";
                    text += "<div class='col-lg-8'><div class='form-group'>";
                    text += "<div class='row' id = 'product_detail'>";
                    text += "<div class='col-lg-4'><img src='images/box.png'></div>";
                    text += "<div class='col-lg-8'>";
                    text += "<h2 id='name'>" + name + "</h2>";
                    text += "<h5><span id='cost'>" + cost + "</span>/- </h5>";
                    text += "<h5 id='description'>" + description + "</h5>";
                    text += "</div></div></div></div><div class='col-lg-12 hide' ><div class='form-group' style='background - color:#c0c0c0;'><button type='button' class='btn btn-primary' style='width: 100%; height: 80px; font-size: xx-large;'> Add To Cart</button></div></div> ";
                    text += "<div class='col-lg-12 hide'><div class='form-group'><button type='button' class='btn btn-success' style='width: 100%; height: 80px; font-size: xx-large;'>Buy Now</button></div></div>";
                    text += "<div class='col-lg-2'></div>";
                    text += "</div>";
                    Data.Text = text;
                    language.Value = Session["lang"].ToString();
                    Data.Visible = true;
                    con.Close();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PageLoad()", true);
                }
                else
                {
                    Data.Text = "Currently, No products found for this category";
                    Data.Visible = true;
                }
            }
        }
        catch (Exception ep)
        {
            Response.Redirect("UserLogin.aspx");
        }

    }
    
}   