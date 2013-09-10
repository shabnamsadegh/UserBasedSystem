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
    public partial class AllBranches : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            branchGrid.Culture = new System.Globalization.CultureInfo("fa-IR");
        }
        protected void branchGrid_PageSizeChanged(object source, GridPageSizeChangedEventArgs e)
        {
            loadData();
        }

        protected void branchGrid_PageIndexChanged(object source, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            loadData();
        }

        protected void branchGrid_SortCommand(object source, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            loadData();
        }
        protected void branchGrid_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            loadData();
        }
        protected void branchGrid_DeleteCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
        {
            //  int news_id = Int32.Parse((e.Item as GridDataItem).GetDataKeyValue("NewsSiteId_Pk").ToString());
            //database.DeleteNews(news_id);
        }
        private void loadData()
        {
            branchGrid.DataSource = database.LoadBranches(-1);
        }
    }
}