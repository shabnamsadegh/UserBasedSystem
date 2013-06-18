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
        bool edit_mode = false;
        int news_id = -1;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString.Count > 0)
            {
                edit_mode = true;
                news_id = Int32.Parse(Request.QueryString[0]);
                LoadNewsForEdit(news_id);
                 
            }

            System.Data.DataTable dt;
            if (!IsPostBack)
            {
                dt = new System.Data.DataTable();
                dt = database.loadSymbols();
                RadComboBox1.DataSource = dt;//QuoteData.Instance.Stocks.Select(x => x.Value).OrderBy(x => x.SymbolName);
                RadComboBox1.DataBind();

                if (!edit_mode)
                {
                    DatePicker1.Date = DateTime.Now;
                    fill_time_field_by_now();
                }
            }
            else
            {
                dt = new System.Data.DataTable();
                dt = database.loadSymbols();
                symbolNames.Value = LoadSelectedSymbols(symbols.Value, dt);
            }
        }
        private void LoadNewsForEdit(int news_id)
        {
            News nw = database.LoadNewsForEdit(news_id);
            loadNews(nw);
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


            News nw = new News(txtTime.Text, dt, txtDescTitle.Text, txtTitle1.Text, txtTitle2.Text, txtNewsSummery.Text,
                        sb.ToString(), ImageUploader.FileName, txtNewsResource.Text, true, symbols.Value);
            // lblTest.Text = nw.news_body;
            if(edit_mode == false)
                database.InsertNews(nw, symbols.Value.ToString(),"i",news_id);
            else
                database.InsertNews(nw, symbols.Value.ToString(), "e",news_id);

        }
        private void loadNews(News nw)
        {
            txtTime.Text = nw.getTime();
            DatePicker1.Date = nw.getPublishDatetime();
            txtTitle1.Text = nw.getTitle1();
            txtTitle2.Text = nw.getTitle2();
            txtDescTitle.Text = nw.getDescTitle();
            txtNewsBody.Text = nw.getNewsBody();
            txtNewsResource.Text = nw.getNewsResource();
            txtNewsSummery.Text = nw.getNewsSummery();
            chkPublish.Checked = nw.getPublication();
            symbols.Value = nw.getSymbolString();
            ParseSymbolString(nw.getSymbolString());
            //symbolNames.Value = 

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
        public void ParseSymbolString(string SymbolString)
        {
            string[] symbolString = SymbolString.Split(',');
            string symbol_id = "";
            string symbol_name = "";
            for (int i = 0; i < symbolString.Length; i++)
            {
                if (i % 2 == 1)
                    symbol_name = symbol_name + symbolString[i] + ".";
                else
                    symbol_id = symbol_id + symbolString[i] + ".";
            }

           // symbolNames.Value = symbol_name.Remove(symbol_name.Length - 1);
            symbolNames.Value = symbol_name;
            symbols.Value = symbol_id.Remove(symbol_id.Length - 1);
        }

    }
}