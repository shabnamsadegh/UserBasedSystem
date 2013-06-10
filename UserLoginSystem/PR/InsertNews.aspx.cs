using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Heidarpour.WebControlUI;
using System.Text;
using System.Data;
namespace CustomWebControlUI
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
             System.Data.DataTable dt;
            if (!IsPostBack)
            {
               dt = new System.Data.DataTable();
                dt = database.loadSymbols();
                RadComboBox1.DataSource = dt;//QuoteData.Instance.Stocks.Select(x => x.Value).OrderBy(x => x.SymbolName);
                RadComboBox1.DataBind();

                DatePicker1.Date = DateTime.Now;
                fill_time_field_by_now();
                // txtNewsBody.Text = "<p style='background-color:green;'>Salam</p>";
            }
            else
            {


                dt = new System.Data.DataTable();
                dt = database.loadSymbols();
               symbolNames.Value = LoadSelectedSymbols(symbols.Value, dt);
            }
        }

        private string LoadSelectedSymbols(string concatenated_symbols, DataTable dt)
        {

            string[] symbols = concatenated_symbols.Split('.');
            string tmp = "";
            int j = 0;
            while (j < dt.Rows.Count)
            {
                for (int i = 1; i < symbols.Length; i++)
                {
                    if (symbols[i] == dt.Rows[j][0].ToString())
                    {
                        tmp = tmp + dt.Rows[j][1].ToString() + ".";
                    }
                }
                j++;
            }

            return tmp;
        }
        protected void btnSubmit1_Click(object sender, EventArgs e)
        {

            //StringBuilder st = new StringBuilder();
        }

        protected void btnSubmit1_Click1(object sender, ImageClickEventArgs e)
        {
            // lblTest.Text = ImageUploader.FileName;
            DateTime dt;
            if (DatePicker1.Date.HasValue)
            {
                dt = (DateTime)DatePicker1.Date;
            }
            else
            {
                dt = DateTime.Now;
            }
            if (txtTime.Text == "")
            {
                fill_time_field_by_now();
            }
            StringBuilder sb = new StringBuilder(HttpUtility.HtmlEncode(txtNewsBody.Text));
            sb.Replace("&lt;b&gt;", "<b>");
            sb.Replace("&lt;/b&gt;", "</b>");
            sb.Replace("&lt;i&gt;", "<i>");
            sb.Replace("&lt;/i&gt;", "</i>");
            // lblTest.Text = sb.ToString();

            News nw = new News(txtTime.Text, dt, txtDescTitle.Text, txtTitle1.Text, txtTitle2.Text, txtNewsSummery.Text, sb.ToString(), ImageUploader.FileName, txtNewsResource.Text, true);
            // lblTest.Text = nw.news_body;
            // database.InsertNews(nw,symbols.Value.ToString());



        }
        private void fill_time_field_by_now()
        {
            string h = DateTime.Now.Hour.ToString();
            string m = DateTime.Now.Minute.ToString();
            if (h.Length == 1)
            {
                h = "0" + h;
            }
            else if (h.Length == 0)
            {
                h = "00";
            }
            if (m.Length == 1)
            {
                m = "0" + m;
            }
            else if (m.Length == 0)
            {
                m = "00";
            }
            txtTime.Text = h + ":" + m;

        }

    }
}