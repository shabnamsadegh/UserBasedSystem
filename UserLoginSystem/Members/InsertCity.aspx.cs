using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CustomWebControlUI;


namespace UserLoginSystem.Members
{
    public partial class InsertCity : System.Web.UI.Page
    {
        bool edit_mode = false;
        int city_id1 = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            
            if (Request.QueryString.Count > 0)
            {
                Int32.TryParse(Request.QueryString["id"], out city_id1);
                //todo check if news_id is not valid

                if (Request.QueryString.Count == 3)
                    edit_mode = true;

            }

            if (!IsPostBack)
            {
                comboState.DataSource = database.LoadStates();
                comboState.DataTextField = "stateName";
                comboState.DataValueField = "stateId_PK";
                comboState.DataBind();
                if (edit_mode)
                {
                    LoadCity(database.LoadCities(city_id1));
                }
                
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
         //   Response.Write(comboState.SelectedItem.Text);
            if(!edit_mode)
          database.InsertCity(Int32.Parse(comboState.SelectedValue), txtCity.Text,"i" , -1); 
            else
             database.InsertCity(Int32.Parse(comboState.SelectedValue), txtCity.Text, "e" ,city_id1); 
        }
    private void LoadCity(System.Data.DataTable dt){
        comboState.SelectedValue = dt.Rows[0]["state_id"].ToString();
        comboState.SelectedItem.Text = dt.Rows[0]["state"].ToString();
        
        
        txtCity.Text = dt.Rows[0]["name"].ToString();
    
    }
    }
}