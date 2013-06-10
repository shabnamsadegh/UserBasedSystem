using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using CustomWebControlUI;

namespace UserLoginSystem.PR
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
        protected void RadGrid1_PageSizeChanged(object source, GridPageSizeChangedEventArgs e)
        {
            loadData();
        }

        protected void RadGrid1_PageIndexChanged(object source, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            loadData();
        }

        protected void RadGrid1_SortCommand(object source, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            loadData();
        }
        protected void RadGrid1_NeedDataSource(object source, GridNeedDataSourceEventArgs e)
        {
            loadData();
        }
        private void loadData()
        {
            NewsGrid.DataSource = database.LoadNews(-1);
        }
    }
}