using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace UserLoginSystem.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            (Page.Master.FindControl("titlecontent") as Label).Text = "ورود به سیستم";

        }

        protected void LoginUser_OnLoggedIn(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            {

                if (Roles.IsUserInRole(LoginUser.UserName, "SiteAdmin"))
                {
                    Response.Redirect("~/PR/NewsPanel.aspx");
                }
                else if (Roles.IsUserInRole(LoginUser.UserName, "NewsMember"))
                {
                    Response.Redirect("~/PR/NewsPanel.aspx");
                }
                else
                {
                    Response.Redirect("~/Account/Login.aspx");
                }
            }
        }

    }
}
