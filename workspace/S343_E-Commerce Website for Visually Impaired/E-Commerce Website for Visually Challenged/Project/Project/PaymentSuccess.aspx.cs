using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PaymentSuccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
            if (!IsPostBack)
            {
                string uid, type, price, status;
                int id = 0;

                status = Request.QueryString["status"];
                uid = Request.QueryString["uid"];
                type = Request.QueryString["type"];
                string Pid = (Session["pid"].ToString());
            language.Value = Session["lang"].ToString();
                if (Pid.Equals("user_cart"))
                {
                    price = Request.QueryString["cost"];
                    this.uid.Value = uid;
                    this.type.Value = type;
                    this.Status.Value = status;                    
                    cost.Text = price;

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PageLoad()", true);
                }
                else
                {
                    id = Convert.ToInt32(Pid);
                    price = Request.QueryString["cost"];
                    this.uid.Value = uid;
                    this.type.Value = type;
                    this.Status.Value = status;

                    pid.Text = id.ToString();

                    cost.Text = price;

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "PageLoad()", true);

                }
            }

        
        //catch (Exception ep)
        //{
        //    Response.Redirect("UserLogin.aspx");
        //}

    }
}