using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Recommendation : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ECommBlind"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            language.Value = Session["lang"].ToString();
            string uid, type, sel, text = "", id, name, price, pname = "", pname_cart = "", status;
            int count, count1, i, j, nodata=0, inc = 0, user = 0, flag = 0;
            SqlDataAdapter da;
            DataSet ds;
            string[] recommname;
            string rname = "";
            uid = Request.QueryString["uid"];
            type = Request.QueryString["type"];
            status = Request.QueryString["status"];
            this.Status.Value = status;
            this.uid.Value = uid;
            this.type.Value = type;

            sel = "select * from cart";
            da = new SqlDataAdapter(sel, conn);
            ds = new DataSet();
            da.Fill(ds);
            count = ds.Tables[0].Rows.Count;
            string[] pname_array = new string[count];

            for (j = 0; j < count; j++)
            {
                pname_array[j] = ds.Tables[0].Rows[j][1].ToString();
            }


            for (j = 0; j < count; j++)
            {
                pname_cart = ds.Tables[0].Rows[j][1].ToString();
                string sel1 = "select * from Orders o where ProductName like '%" + pname_cart + "%' ";
                SqlDataAdapter da1 = new SqlDataAdapter(sel1, conn);
                DataSet ds1 = new DataSet();
                da1.Fill(ds1);
                count1 = ds1.Tables[0].Rows.Count;

                if (count1 > 0)
                {
                    for (i = 0; i < count1; i++)
                    {
                        pname = ds1.Tables[0].Rows[i][1].ToString();
                        string[] pnamelist = pname.Split(',');
                        int namelength = pnamelist.Length;
                        if (namelength > 1)
                        {
                            string[] poname = { };
                            foreach (string line in pnamelist)
                            {
                                poname = line.Split(':');
                                string name1 = poname[0].Remove(0, 1);
                                for (int k = 0; k < count; k++)
                                {
                                    if (name1 == pname_array[k])
                                    {
                                        user = 1;
                                    }
                                    else
                                    {
                                        if(user == 1)
                                        {

                                        }
                                        else
                                        {
                                            user = 0;
                                        }
                                    }
                                }
                                if(user == 0)
                                {
                                    nodata = 1;
                                    rname += name1 + ",";
                                    flag = 1;
                                    inc++;
                                }
                                else
                                {
                                    if (flag == 1)
                                    {

                                    }
                                    else
                                    {
                                        flag = 0;
                                    }
                                }
                                user = 0;
                            }
                        }
                    }
                }   
            }
            if (flag==1)
            {
                rname = rname.TrimEnd(',');
                recommname = rname.Split(',');
                if (recommname.Length != 0)
                {
                    text += "<center><div class='container'><div class='row'>";
                    for (int m = 0; m < recommname.Length; m++)
                    {
                        if (m < 2)
                        {
                            Count.Text = recommname.Length.ToString();
                            string select = "SELECT  * FROM Product where ProductName='" + recommname[m] + "'";
                            SqlDataAdapter da2 = new SqlDataAdapter(select, conn);
                            DataSet ds2 = new DataSet();
                            da2.Fill(ds2);

                            id = ds2.Tables[0].Rows[0][0].ToString();
                            name = ds2.Tables[0].Rows[0][1].ToString();
                            price = ds2.Tables[0].Rows[0][2].ToString();
                            text += "<div class='col-md-1'></div>";
                            text += "<div class='shadow-lg p-3 mb-5 bg-white rounded col-md-3' id='product'>";
                            text += "<img src ='images/box.png'><br/><br/>";
                            text += "<h3 id='id" + m + "' class='hide'>" + id + "</h3>";
                            text += "<h3 id='product_name" + m + "'>" + name + "</h3>";
                            text += "<h4 > Price : <span style='font-weight:initial;' id='price" + m + "'>" + price + "/-</span></h4>";
                            text += "</div>";
                            text += "<div class='col-md-1'></div>";
                        }
                        //else
                        //{
                        //    if (m < 3)
                        //    {
                        //        text += "</div></div></center>";
                        //    }
                        //}
                    }
                    text += "</div></div></center>";
                    content.Text = text;
                    content.Visible = true;
                    conn.Close();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction()", true);
                }
            }

            else
            {
                sel = "SELECT  Top 2 * FROM Product p where NOT EXISTS(select Pid from Cart c where c.Pid = p.Pid)  ORDER BY NEWID() ";
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
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction()", true);
                }
                else
                {
                    content.Text = "Currently, No Recommendations are here";
                    content.Visible = true;
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "NoData()", true);
                }
            }
        }
    }
}