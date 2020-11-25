using Media.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Media.Admin
{
    public partial class PageList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");                
            }

            if(!IsPostBack)
            {
                Category objcat = new Category();

                rptpages.DataSource = objcat.getPageCount();
                rptpages.DataBind();
            }

        }

        protected void rptpages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                object container = e.Item.DataItem;
                string baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + DataBinder.Eval(container, "CatLink").ToString();
                Label lbllink = e.Item.FindControl("lbllink") as Label;
                lbllink.Text = "View Page";

                HtmlAnchor ankpage = (HtmlAnchor)e.Item.FindControl("ankpage");
                ankpage.HRef = baseUrl;

            }
        }

        protected void rptpages_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.CommandName == "AddRss")
                {
                    Response.Redirect("AddRss.aspx?CatID=" + e.CommandArgument);
                }
            }
        }
    }
}