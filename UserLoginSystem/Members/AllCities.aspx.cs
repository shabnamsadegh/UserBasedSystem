using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using CustomWebControlUI;

namespace UserLoginSystem.Members
{
    public partial class AllCities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cityGrid.Culture = new System.Globalization.CultureInfo("fa-IR");
        }
        protected void cityGrid_PageSizeChanged(object source, GridPageSizeChangedEventArgs e)
        {
            loadData();
        }

        protected void cityGrid_PageIndexChanged(object source, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            loadData();
        }

        protected void cityGrid_SortCommand(object source, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            loadData();
        }
        protected void cityGrid_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            loadData();
        }
        protected void cityGrid_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
          //  int news_id = Int32.Parse((e.Item as GridDataItem).GetDataKeyValue("NewsSiteId_Pk").ToString());
            //database.DeleteNews(news_id);
        }
        private void loadData()
        {
            cityGrid.DataSource = database.LoadCities(-1);
        }
    }
}