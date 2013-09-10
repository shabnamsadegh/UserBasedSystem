using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CustomWebControlUI;
using Telerik.Web.UI;
namespace UserLoginSystem.Listing
{
    public partial class AllInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            listGrid.Culture = new System.Globalization.CultureInfo("fa-IR");
        }
        protected void listGrid_PageSizeChanged(object source, GridPageSizeChangedEventArgs e)
        {
            loadData();
        }

        protected void listGrid_PageIndexChanged(object source, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            loadData();
        }

        protected void listGrid_SortCommand(object source, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            loadData();
        }
        protected void listGrid_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            loadData();
        }
        protected void listGrid_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            //  int news_id = Int32.Parse((e.Item as GridDataItem).GetDataKeyValue("NewsSiteId_Pk").ToString());
            //database.DeleteNews(news_id);
        }
        private void loadData()
        {
            listGrid.DataSource = database.LoadInstrumentInfo(-1);
        }
    }
}