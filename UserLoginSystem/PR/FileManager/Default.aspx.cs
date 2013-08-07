using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FileManager_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        AuthenticateFileManager();
        Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetNoStore();
        Response.Write("salam");
    }



    // chnage this funcation if you want to create your Authenticate 
    public void AuthenticateFileManager()
    {
     
        /* Edit this funcation to  AuthenticateFileManager*/
        string SessionID = Request["sessionid"].ToString();

        if (Request.Cookies[SessionID] != null)
        {

        }
        else
        {
            Response.Clear();
            Response.Write("Access Denied");
            Response.End();
        }

    }
}