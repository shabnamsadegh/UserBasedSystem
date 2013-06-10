<%@ Page Title="" Language="C#" MasterPageFile="~/PR/PR.master" AutoEventWireup="true" CodeBehind="ViewNews.aspx.cs" Inherits="UserLoginSystem.PR.ViewNews" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <link href="Sunset/Grid.Sunset.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">

    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="NewsGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="NewsGrid"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div class="tableParent">
        <telerik:RadGrid ID="NewsGrid" AllowFilteringByColumn="True" AllowSorting="True"
            AllowPaging="True" Width="100%" PageSize="20" runat="server" AutoGenerateColumns="False"
            EnableLinqExpressions="false" OnSortCommand="RadGrid1_SortCommand" OnPageIndexChanged="RadGrid1_PageIndexChanged"
            OnPageSizeChanged="RadGrid1_PageSizeChanged" OnNeedDataSource="RadGrid1_NeedDataSource" EnableEmbeddedSkins="False" Skin="Sunset">
            <MasterTableView >
                <Columns>
                    <telerik:GridHyperLinkColumn UniqueName="title" DataTextField="title1" DataNavigateUrlFields="news_id"
                        DataNavigateUrlFormatString="News.aspx?id={0}" HeaderText="تیتر اول" AutoPostBackOnFilter="false"
                        HeaderStyle-Width="200px" ShowFilterIcon="false" CurrentFilterFunction="contains" FilterDelay="0">
                    </telerik:GridHyperLinkColumn>
                    <telerik:GridBoundColumn UniqueName="DateTime" DataField="DateTime" HeaderText="تاریخ" HeaderStyle-Width="30px" AllowFiltering="false"> 
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Title2" DataField="Title2" HeaderText="تیتر دوم" HeaderStyle-Width="30px" AllowFiltering="false"> 
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn UniqueName="TitleDesc" DataField="TitleDesc" HeaderText="رو تیتر" HeaderStyle-Width="30px" AllowFiltering="false"> 
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn UniqueName="Summery" DataField="Summery" HeaderText="خلاصه خبر" HeaderStyle-Width="30px" AllowFiltering="false"> 
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn UniqueName="Body" DataField="Body" HeaderText="متن خبر" HeaderStyle-Width="30px" AllowFiltering="false"> 
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn UniqueName="Link" DataField="Link" HeaderText="منبع خبر" HeaderStyle-Width="30px" AllowFiltering="false"> 
                    </telerik:GridBoundColumn>
                  
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
</asp:Content>
