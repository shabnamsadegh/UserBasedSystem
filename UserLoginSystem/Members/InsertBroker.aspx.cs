using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CustomWebControlUI; 
namespace UserLoginSystem.Members
{

    public partial class InsertMembers : System.Web.UI.Page
    {
        bool edit_mode = false;
        int broker_id1 = -1;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString.Count > 0)
            {
                Int32.TryParse(Request.QueryString["id"], out broker_id1);
                //todo check if news_id is not valid

                if (Request.QueryString.Count == 3)
                    edit_mode = true;

            }

            if (!IsPostBack)
            {
                
                if (edit_mode)
                {
                    LoadBroker(database.LoadBrokers(broker_id1));
                }

            }
        }
        private void LoadBroker(System.Data.DataTable dt) {
            txtName.Text = dt.Rows[0]["name"].ToString();
            txtLink.Text = dt.Rows[0]["link"].ToString();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if (!edit_mode)
                database.InsertBroker(txtName.Text, txtLink.Text , "i", -1);
            else
                database.InsertBroker(txtName.Text, txtLink.Text, "e", broker_id1); 
        }
    }
}