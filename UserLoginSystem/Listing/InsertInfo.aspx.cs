using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CustomWebControlUI;
namespace UserLoginSystem.Listing
{
    public partial class InsertInfo : System.Web.UI.Page
    {
        bool edit_mode = false;
        int list_id1 = -1;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString.Count > 0)
            {
                Int32.TryParse(Request.QueryString["id"], out list_id1);
                //todo check if news_id is not valid

                if (Request.QueryString.Count == 3)
                    edit_mode = true;

            }

            if (!IsPostBack)
            {

                RadComboBoxInstrument.DataSource = database.LoadInstruments();
                RadComboBoxInstrument.DataBind();
                if (edit_mode)
                {
                    LoadList(database.LoadInstrumentInfo(list_id1));
                }

            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            
            if (!edit_mode)
                database.InsertInstrumentInfo(Int32.Parse( RadComboBoxInstrument.SelectedItem.Value.ToString()),txtAddress.Text,txtEmail.Text,txtTel.Text,txtBoss.Text,txtSite.Text,  "i", -1);
            else
                database.InsertInstrumentInfo(Int32.Parse(RadComboBoxInstrument.SelectedItem.Value.ToString()), txtAddress.Text, txtEmail.Text, txtTel.Text, txtBoss.Text, txtSite.Text, "e", list_id1); 
        }
        private void LoadList(System.Data.DataTable dt)
        {
            RadComboBoxInstrument.SelectedValue = dt.Rows[0]["instruId"].ToString();
            RadComboBoxInstrument.SelectedItem.Text = dt.Rows[0]["instruTitle"].ToString();

            txtAddress.Text = dt.Rows[0]["address"].ToString();
            txtBoss.Text = dt.Rows[0]["boss"].ToString();
            txtEmail.Text = dt.Rows[0]["email"].ToString();
            txtSite.Text = dt.Rows[0]["site"].ToString();
            txtTel.Text = dt.Rows[0]["tel"].ToString();
        }
    }
}