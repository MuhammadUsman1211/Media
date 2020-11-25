using Media.App_Code;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Media.Admin
{
    public partial class AddRss : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                if(Request.QueryString["CatID"]==null)
                    Response.Redirect("PageList.aspx");


                Category objcat = new Category();
                rptRss.DataSource = objcat.getPageRss(Convert.ToInt32(Request.QueryString["CatID"]));
                rptRss.DataBind();
                hdncatid.Value = Request.QueryString["CatID"].ToString();
            }

        }

        protected void btnaddrss_Click(object sender, EventArgs e)
        {
            Category objcat = new Category();
            objcat.AddRSS(Convert.ToInt32(hdncatid.Value), txtAddrss.Text);
            rptRss.DataSource = objcat.getPageRss(Convert.ToInt32(hdncatid.Value));
            rptRss.DataBind();
            txtAddrss.Text = "";

        }

        protected void rptRss_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.CommandName == "Delete")
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConStr"].ConnectionString))
                    {
                        using (SqlCommand cmd = new SqlCommand("DELETE FROM RSSLinks WHERE Recid=@id", con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@id", e.CommandArgument);
                            cmd.ExecuteNonQuery();

                            Category objcat = new Category();
                            rptRss.DataSource = objcat.getPageRss(Convert.ToInt32(hdncatid.Value));
                            rptRss.DataBind();
                        }
                    }
                }
            }
        }
    }
}