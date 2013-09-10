using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using CustomWebControlUI;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace UserLoginSystem.Members
{
    public partial class ViewNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NewsGrid.Culture = new System.Globalization.CultureInfo("fa-IR");
                loadData();
            }

        }
        protected void NewsGrid_PageSizeChanged(object source, GridPageSizeChangedEventArgs e)
        {
            loadData();
        }

        protected void NewsGrid_PageIndexChanged(object source, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            loadData();
        }

        protected void NewsGrid_SortCommand(object source, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            loadData();
        }
        protected void NewsGrid_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            loadData();
        }
        protected void NewsGrid_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            int news_id = Int32.Parse((e.Item as GridDataItem).GetDataKeyValue("NewsSiteId_Pk").ToString());
            database.DeleteNews(news_id);
        }
        private void loadData()
        {
            NewsGrid.DataSource = database.LoadNews(-1);
        }
        public static string ToPersianDate(DateTime dt)
        {
            PersianCalendar p = new PersianCalendar();

            return p.GetYear(dt).ToString() + "/" + p.GetMonth(dt).ToString("0") + "/" +
             p.GetDayOfMonth(dt).ToString("00");
        }
        public string ParseSymbolString(string SymbolString)
        {
            string[] symbols = SymbolString.Split(',');
            string tmp = "";
            for (int i = 0; i < symbols.Length; i++)
            {
                if (i % 2 == 1)
                    tmp = tmp + symbols[i] + ",";
            }
            if (tmp.Length > 0)
                return tmp.Remove(tmp.Length - 1);
            else return "";
        }
    }
}