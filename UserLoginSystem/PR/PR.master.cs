using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserLoginSystem.PR
{
    public partial class PR : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            (Page.Master.Master.FindControl("titlecontent") as Label).Text = "پنل روابط عمومی";
        }
    }
}