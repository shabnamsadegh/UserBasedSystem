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
           // Page.Form.Action = "Photo Category.aspx?tab1=tab_gallery&tab2=photoCategory";

            if (Request.QueryString.Count > 0)
            {
                Int32.TryParse(Request.QueryString["id"], out news_id);
                //todo check if news_id is not valid

                if (Request.QueryString.Count == 3)
                    edit_mode = true;

            }

            if (!IsPostBack)
            {
                RadComboBox1.DataSource = database.loadSymbols();
                RadComboBox1.DataBind();

                if (!edit_mode)
                {
                    DatePicker1.Date = DateTime.Now;
                    txtTime.Text = DateTime.Now.ToString("hh:mm");
                }
                else
                {
                    loadNews(database.LoadNewsForEdit(news_id));
                }
            }

        }
        private string LoadSelectedSymbols(string concatenated_symbols, DataTable dt)
        {

            string[] symbols = concatenated_symbols.Split('.');
            string tmp = "";
            int j = 0;
            while (j < dt.Rows.Count)
            {
                for (int i = 0; i < symbols.Length; i++)
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
            image_src.Value = nw.getImageFileName();
            // symbols.Value = nw.getSymbolString();
            ParseSymbolString(nw.getSymbolString());
            //symbolNames.Value = 

        }


        public void ParseSymbolString(string SymbolString)
        {
            string[] symbolString = SymbolString.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            string symbol_id = "";
            string symbol_name = "";
            for (int i = 0; i < symbolString.Length; i++)
            {
                if (i % 2 == 1)
                    symbol_name = symbol_name + symbolString[i] + ".";
                else
                    symbol_id = symbol_id + symbolString[i] + ".";
            }
            if (symbolString.Length > 0)
            {
                symbolNames.Value = symbol_name.Remove(symbol_name.Length - 1);
                symbols.Value = symbol_id.Remove(symbol_id.Length - 1);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
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
                txtTime.Text = DateTime.Now.ToString("hh:mm");
            }
            //StringBuilder sb = new StringBuilder(HttpUtility.HtmlEncode(txtNewsBody.Text));
            //sb.Replace("&lt;b&gt;", "<b>");
            //sb.Replace("&lt;/b&gt;", "</b>");
            //sb.Replace("&lt;i&gt;", "<i>");
            //sb.Replace("&lt;/i&gt;", "</i>");


            News nw = new News(txtTime.Text, dt, txtDescTitle.Text, txtTitle1.Text, txtTitle2.Text, txtNewsSummery.Text,
                        txtNewsBody.Text, image_src.Value, txtNewsResource.Text, true, symbols.Value);
            // lblTest.Text = nw.news_body;
            if (edit_mode == false)
                database.InsertNews(nw, symbols.Value.ToString(), "i", news_id);
            else
                database.InsertNews(nw, symbols.Value.ToString(), "e", news_id);
        }

        //protected void btnGoToGallery_Click(object sender, EventArgs e)
        //{


         
        //}
        //Response.Redirect("Photo Category.aspx?tab1=tab_gallery&tab2=photoCategory");
    }

}