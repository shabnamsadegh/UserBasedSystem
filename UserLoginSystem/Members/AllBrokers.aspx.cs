using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CustomWebControlUI;
using Telerik.Web.UI;
namespace UserLoginSystem.Members
{
    public partial class AllBrokers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            brokerGrid.Culture = new System.Globalization.CultureInfo("fa-IR");
        }
        protected void brokerGrid_PageSizeChanged(object source, GridPageSizeChangedEventArgs e)
        {
            loadData();
        }

        protected void brokerGrid_PageIndexChanged(object source, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            loadData();
        }

        protected void brokerGrid_SortCommand(object source, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            loadData();
        }
        protected void brokerGrid_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            loadData();
        }
        protected void brokerGrid_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            //  int news_id = Int32.Parse((e.Item as GridDataItem).GetDataKeyValue("NewsSiteId_Pk").ToString());
            //database.DeleteNews(news_id);
        }
        private void loadData()
        {
            brokerGrid.DataSource = database.LoadBrokers(-1);
        }
    }
}