using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Media.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (login.Value.Trim(' ') == "Chris" && password.Value.Trim(' ') == "chris@!12")
            {
                Session["UserName"] = "Chris";
                Response.Redirect("PageList.aspx");
            }
            else
            {
                lblerrormsg.Visible = true;
            }
                   
        }
    }
}