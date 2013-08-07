<%@ Page Title="" Language="C#" MasterPageFile="~/PR/PR.master" AutoEventWireup="true" CodeBehind="ViewNews.aspx.cs" Inherits="UserLoginSystem.PR.ViewNews" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .tableParent
    {
        width:90%;
        text-align:center;
        margin-right: 5%;
        }
        .thumbnail
 {
  width: 60px;
   height:60px;
  /* display:inline-block;*/
  
   border:2px solid #00CCFF;
        }
/* th.GridHeader_Default,th.ResizeHeader_Default
  {
    background-color: Red; !important;
      }        
      
      .rgHeader
      {
          background-color: Red; !important;
          border-radius: 5px;
          }
          .rgRow
          {
              background-color:Lime;
              }
              
          .rgAltRow
          {
              background-color:Aqua;
              
              }*/
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
    <div  id="main_div2" class="main ui-widget-content" >
       <img id="pin" src="/Images/pin.png" />
        <telerik:RadGrid ID="NewsGrid" AllowFilteringByColumn="True" AllowSorting="True"
            AllowPaging="True" Width="100%" PageSize="8" runat="server" AutoGenerateColumns="False"
            EnableLinqExpressions="false" OnSortCommand="NewsGrid_SortCommand" OnPageIndexChanged="NewsGrid_PageIndexChanged" OnDeleteCommand="NewsGrid_DeleteCommand"
            OnPageSizeChanged="NewsGrid_PageSizeChanged" OnNeedDataSource="NewsGrid_NeedDataSource" EnableEmbeddedSkins="True" Skin="Vista" >
            <MasterTableView DataKeyNames="Titl1,NewsSiteId_Pk,DateTime,Title2,TitleDesc,Summery,Body,Link,publication,symbols" >
                <Columns >
                    <telerik:GridBoundColumn UniqueName="Titl1" DataField="Titl1"   AllowFiltering="false"
                         HeaderText="تیتر اول"
                        >
                    </telerik:GridBoundColumn>
                 
                    <telerik:GridTemplateColumn UniqueName="date" DataField="DateTime" HeaderText="تاریخ"   AllowFiltering="false"  > 
                    <ItemTemplate>
                    <%#ToPersianDate((DateTime)Eval("DateTime")) %>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridBoundColumn UniqueName="time" DataField="time" HeaderText="زمان"   AllowFiltering="false"  >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Title2" DataField="Title2" HeaderText="تیتر دوم"   AllowFiltering="false"  > 
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn UniqueName="TitleDesc" DataField="TitleDesc" HeaderText="رو تیتر"   AllowFiltering="false"  > 
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn UniqueName="Summery" DataField="Summery" HeaderText="خلاصه خبر"   AllowFiltering="false"  > 
                    </telerik:GridBoundColumn>
                     <telerik:GridTemplateColumn UniqueName="Body" DataField="Body" HeaderText="متن خبر"   AllowFiltering="false" DataType="System.String"  > 
                     <ItemTemplate>
                     <%#Eval("Body") %>
                     <%--<script type="text/javascript">
                         document.write();
                     </script>--%>
                     </ItemTemplate>
                    </telerik:GridTemplateColumn>
                     <telerik:GridBoundColumn UniqueName="Link" DataField="Link" HeaderText="منبع خبر"   AllowFiltering="false" > 
                    </telerik:GridBoundColumn>
                   
                    <telerik:GridTemplateColumn UniqueName="symbols" DataField="symbols" HeaderText="نماد مرتبط" AllowFiltering="false" >
                    <ItemTemplate>
                     <%#ParseSymbolString(Eval("symbols").ToString())%>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                   <telerik:GridTemplateColumn UniqueName="ImageUrl" HeaderText="تصویر" DataField="ImageUrl" AllowFiltering="false">
                        <ItemTemplate>
                            <img class="thumbnail" src=" <%#Eval("ImageUrl") %>" />
                        </ItemTemplate>
                   </telerik:GridTemplateColumn>
                    <telerik:GridCheckBoxColumn  UniqueName="publication" DataField="publication" HeaderText="انتشار"   AllowFiltering="false"  ></telerik:GridCheckBoxColumn>
                    <telerik:GridHyperLinkColumn DataNavigateUrlFormatString="InsertNews.aspx?tab1=tab_news&tab2=allNews&id={0}" DataNavigateUrlFields="NewsSiteId_Pk" ShowFilterIcon="false"
                     CurrentFilterFunction="contains" FilterDelay="0"  AutoPostBackOnFilter="false"   ImageUrl="/Images/edit.png"
                     DataTextField="" HeaderText="ویرایش"   AllowFiltering="false" ></telerik:GridHyperLinkColumn>
                     <telerik:GridButtonColumn CommandName="delete"  UniqueName="Delete" ButtonType="ImageButton" ConfirmText="آیا از حذف نمودن این خبر مطمئن هستید?" ConfirmTitle="احتیاط"
                      ImageUrl="/Images/Delete.png"    HeaderText="حذف"  ButtonCssClass="ui-button-text"></telerik:GridButtonColumn>
                </Columns>
            </MasterTableView>
            <ClientSettings EnableAlternatingItems="true" EnableRowHoverStyle="true" >
            <Selecting CellSelectionMode="None" AllowRowSelect="true"/>
            
            </ClientSettings>
        </telerik:RadGrid>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
<script type="text/javascript">
 function  runWhenDocIsReady() {
     $("#tabs").tabs();
      //$('#ctl00_ctl00_MainPlaceHolder_MainPlaceHolder_NewsGrid').live('selectstart dragstart', function (evt) { evt.preventDefault(); return false; });
 }
 </script>
 <script type="text/javascript" src="../Scripts/PersianDate.js">
    
 </script>
</asp:Content>
