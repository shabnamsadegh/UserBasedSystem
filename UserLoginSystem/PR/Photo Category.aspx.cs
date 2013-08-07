using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using CustomWebControlUI;
using System.IO;
using System.Collections.Specialized;
namespace UserLoginSystem.PR
{
    public partial class Photo_Category : System.Web.UI.Page
    {
        public string str_page = "";
        public NameValueCollection data;
        protected void Page_Load(object sender, EventArgs e)
        {
            var chararray = System.IO.Path.GetInvalidPathChars();
            Response.Cookies[Session.SessionID].Value = "True";
            Response.Cookies[Session.SessionID].Expires = DateTime.Now.AddHours(3);
            bool flag = false;
           /*  data = new NameValueCollection();
            foreach (string key in Request.Form.AllKeys)
            {
                if (key.Contains("DatePicker1"))
                    data.Add("DatePicker1", Request.Form[key]);
                if (key.Contains("txtTime"))
                    data.Add("txtTime", Request.Form[key]);
                if (key.Contains("chkPublish"))
                    data.Add("chkPublish", Request.Form[key]);
                if (key.Contains("txtDescTitle"))
                    data.Add("txtDescTitle", Request.Form[key]);
                if (key.Contains("txtTitle1"))
                    data.Add("txtTitle1", Request.Form[key]);
                if(key.Contains("txtTitle2"))
                    data.Add("txtTitle2", Request.Form[key]);
                if (key.Contains("txtNewsSummery"))
                    data.Add("txtNewsSummery", Request.Form[key]);
                if(key.Contains("txtNewsBody"))
                    data.Add("txtNewsBody", Request.Form[key]);
                if (key.Contains("txtNewsResource"))
                    data.Add("txtNewsResource", Request.Form[key]);
                if (key.Contains("symbols"))
                    data.Add("symbols", Request.Form[key]);
                if (key.Contains("symbolNames"))
                    data.Add("symbolNames", Request.Form[key]);

            }*/
          //  HttpHelper.RedirectAndPOST(this.Page, "InsertNews.aspx", data);
            // Response.Write(Request.Form["txtNewsSummery"]);
                   
        }
      
      
    }
}