<%@ Page Title="" Language="C#" MasterPageFile="~/PR/PR.master" AutoEventWireup="true" CodeBehind="ViewNews.aspx.cs" Inherits="UserLoginSystem.PR.ViewNews" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Sunset/Grid.Sunset.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .tableParent
    {
        width:90%;
        text-align:center;
        margin-right: 5%;
        }
    </style>
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
            EnableLinqExpressions="false" OnSortCommand="NewsGrid_SortCommand" OnPageIndexChanged="NewsGrid_PageIndexChanged" OnDeleteCommand="NewsGrid_DeleteCommand"
            OnPageSizeChanged="NewsGrid_PageSizeChanged" OnNeedDataSource="NewsGrid_NeedDataSource" EnableEmbeddedSkins="False" Skin="Sunset">
            <MasterTableView DataKeyNames="Titl1,NewsSiteId_Pk,DateTime,Title2,TitleDesc,Summery,Body,Link,publication,symbols">
                <Columns>
                    <telerik:GridBoundColumn UniqueName="Titl1" DataField="Titl1" 
                         HeaderText="تیتر اول"
                        HeaderStyle-Width="30px" >
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn UniqueName="NewsSiteId_Pk" DataField="NewsSiteId_Pk" 
                         HeaderText="x"
                        HeaderStyle-Width="30px" >
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn UniqueName="date" DataField="DateTime" HeaderText="تاریخ" HeaderStyle-Width="30px" AllowFiltering="false"> 
                    <ItemTemplate>
                    <%#ToPersianDate((DateTime)Eval("DateTime")) %>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn UniqueName="time" DataField="time" HeaderText="زمان" HeaderStyle-Width="30px" AllowFiltering="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Title2" DataField="Title2" HeaderText="تیتر دوم" HeaderStyle-Width="30px" AllowFiltering="false"> 
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn UniqueName="TitleDesc" DataField="TitleDesc" HeaderText="رو تیتر" HeaderStyle-Width="30px" AllowFiltering="false"> 
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn UniqueName="Summery" DataField="Summery" HeaderText="خلاصه خبر" HeaderStyle-Width="30px" AllowFiltering="false"> 
                    </telerik:GridBoundColumn>
                     <telerik:GridTemplateColumn UniqueName="Body" DataField="Body" HeaderText="متن خبر" HeaderStyle-Width="30px" AllowFiltering="false"> 
                     <ItemTemplate>
                     <%#Eval("Body") %>
                     <%--<script type="text/javascript">
                         document.write();
                     </script>--%>
                     </ItemTemplate>
                    </telerik:GridTemplateColumn>
                     <telerik:GridBoundColumn UniqueName="Link" DataField="Link" HeaderText="منبع خبر" HeaderStyle-Width="30px" AllowFiltering="false"> 
                    </telerik:GridBoundColumn>
                   
                    <telerik:GridTemplateColumn UniqueName="symbols" DataField="symbols" HeaderText="نماد مرتبط">
                    <ItemTemplate>
                     <%#ParseSymbolString(Eval("symbols").ToString())%>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                   
                    <telerik:GridCheckBoxColumn  UniqueName="publication" DataField="publication" HeaderText="انتشار" HeaderStyle-Width="30px" AllowFiltering="false"></telerik:GridCheckBoxColumn>
                    <telerik:GridHyperLinkColumn DataNavigateUrlFormatString="InsertNews.aspx?id={0}" DataNavigateUrlFields="NewsSiteId_Pk" ShowFilterIcon="false"
                     CurrentFilterFunction="contains" FilterDelay="0"  AutoPostBackOnFilter="false"   ImageUrl="Sunset/Grid/Edit.gif"  
                     DataTextField="" HeaderText="ویرایش" HeaderStyle-Width="30px"></telerik:GridHyperLinkColumn>
                     <telerik:GridButtonColumn CommandName="Delete"  UniqueName="Delete" ButtonType="ImageButton" ConfirmText="آیا از حذف نمودن این خبر مطمئن هستید?" ConfirmTitle="احتیاط"
                      ImageUrl="Sunset/Grid/Delete.gif"  HeaderStyle-Width="30px" HeaderText="حذف"  ></telerik:GridButtonColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
<script type="text/javascript">
 function  runWhenDocIsReady() {

 }
 </script>
 <script type="text/javascript" src="../Scripts/PersianDate.js">
    
 </script>
</asp:Content>
