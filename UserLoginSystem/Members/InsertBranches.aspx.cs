using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CustomWebControlUI;

namespace UserLoginSystem.Members
{
    public partial class InsertBranches : System.Web.UI.Page
    {
        int branch_id1 = -1;
        bool edit_mode = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count > 0)
            {
                Int32.TryParse(Request.QueryString["id"], out branch_id1);
                //todo check if news_id is not valid

                if (Request.QueryString.Count == 3)
                    edit_mode = true;

            }

            if (!IsPostBack)
            {
                comboBroker.DataSource = database.LoadBrokers(-1);
                comboBroker.DataTextField = "name";
                comboBroker.DataValueField = "id";
                comboBroker.DataBind();


                ComboCity.DataSource = database.LoadCities(-1);
                ComboCity.DataTextField = "name";
                ComboCity.DataValueField = "id";
                ComboCity.DataBind();

                lblMesssage.Text = "";
                if (edit_mode)
                {
                    LoadBranch(database.LoadBranches(branch_id1));
                }

            }
        }
        private void LoadBranch(System.Data.DataTable dt)
        {
            comboBroker.SelectedValue = dt.Rows[0]["broker_id"].ToString();
            comboBroker.SelectedItem.Text = dt.Rows[0]["broker"].ToString();

            ComboCity.SelectedValue = dt.Rows[0]["city_id"].ToString();
            ComboCity.SelectedItem.Text = dt.Rows[0]["city"].ToString();
            
            txtBranchName.Text = dt.Rows[0]["name"].ToString();
            Txtaddress.Text = dt.Rows[0]["address"].ToString();
            txtTel.Text = dt.Rows[0]["tel"].ToString();

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if (!edit_mode)
            {
                database.InsertBranch(Int32.Parse(comboBroker.SelectedValue.ToString()), txtBranchName.Text, Int32.Parse(ComboCity.SelectedValue.ToString()), Txtaddress.Text, txtTel.Text, "i", -1);
                lblMesssage.Text = "شعبه جدید اضافه شد";
            }
            else
            {
                database.InsertBranch(Int32.Parse(comboBroker.SelectedValue.ToString()), txtBranchName.Text, Int32.Parse(ComboCity.SelectedValue.ToString()), Txtaddress.Text, txtTel.Text, "e", branch_id1);
                lblMesssage.Text = "تغییرات شعبه اعمال شد";
            }
        }
    }
}