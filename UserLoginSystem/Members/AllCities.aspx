<%@ Page Title="" Language="C#" MasterPageFile="~/Members/Members.master" AutoEventWireup="true" CodeBehind="AllCities.aspx.cs" Inherits="UserLoginSystem.Members.AllCities" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">
 <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="cityGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="cityGrid"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div  id="main_div3" class="main ui-widget-content" >
       <img id="pin" src="/Images/pin.png" />
        <telerik:RadGrid ID="cityGrid" AllowFilteringByColumn="True" AllowSorting="True"
            AllowPaging="True" Width="100%" PageSize="8" runat="server" AutoGenerateColumns="False"
            EnableLinqExpressions="false" OnSortCommand="cityGrid_SortCommand" OnPageIndexChanged="cityGrid_PageIndexChanged" OnDeleteCommand="cityGrid_DeleteCommand"
            OnPageSizeChanged="cityGrid_PageSizeChanged" OnNeedDataSource="cityGrid_NeedDataSource" EnableEmbeddedSkins="True" Skin="Vista" >
            <MasterTableView DataKeyNames="id,state,name" >
                <Columns >
                   
              
                    <telerik:GridBoundColumn UniqueName="id" DataField="id" HeaderText="شماره"   AllowFiltering="true"  >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="state" DataField="state" HeaderText="استان"   AllowFiltering="false"  > 
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn UniqueName="name" DataField="name" HeaderText="شهر"   AllowFiltering="false"  > 
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridHyperLinkColumn DataNavigateUrlFormatString="InsertCity.aspx??tab1=tab_city&tab2=newCity&id={0}" DataNavigateUrlFields="id" ShowFilterIcon="false"
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
</asp:Content>
