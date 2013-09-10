<%@ Page Title="" Language="C#" MasterPageFile="~/Listing/Listing.master" AutoEventWireup="true" CodeBehind="AllInfo.aspx.cs" Inherits="UserLoginSystem.Listing.AllInfo" %>
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
    <div  id="main_div" class="main ui-widget-content" >
       <img id="pin" src="/Images/pin.png" />
        <telerik:RadGrid ID="listGrid" AllowFilteringByColumn="True" AllowSorting="True"
            AllowPaging="True" Width="100%" PageSize="8" runat="server" AutoGenerateColumns="False"
            EnableLinqExpressions="false" OnSortCommand="listGrid_SortCommand" OnPageIndexChanged="listGrid_PageIndexChanged" OnDeleteCommand="listGrid_DeleteCommand"
            OnPageSizeChanged="listGrid_PageSizeChanged" OnNeedDataSource="listGrid_NeedDataSource" EnableEmbeddedSkins="True" Skin="Vista" >
            <MasterTableView DataKeyNames="id,instruTitle,address,email,tel,site" >
                <Columns >
                   
              
                    <telerik:GridBoundColumn UniqueName="id" DataField="id" HeaderText="شماره"   AllowFiltering="true"  >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="instruTitle" DataField="instruTitle" HeaderText="نام شرکت"   AllowFiltering="true"  >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="address" DataField="address" HeaderText="آدرس"   AllowFiltering="true"  >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="email" DataField="email" HeaderText="پست الکترونیکی"   AllowFiltering="true"  >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="tel" DataField="tel" HeaderText="نام مدیر عامل"   AllowFiltering="true"  >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="site" DataField="site" HeaderText="آدرس سایت"   AllowFiltering="true"  >
                    </telerik:GridBoundColumn>
                    
                    <telerik:GridHyperLinkColumn DataNavigateUrlFormatString="InsertInfo.aspx??tab1=tab_list&tab2=newInfo&id={0}" DataNavigateUrlFields="id" ShowFilterIcon="false"
                     CurrentFilterFunction="contains" FilterDelay="0"  AutoPostBackOnFilter="false"   ImageUrl="/Images/edit.png"
                     DataTextField="" HeaderText="ویرایش"   AllowFiltering="false" ></telerik:GridHyperLinkColumn>
                     <telerik:GridButtonColumn CommandName="delete"  UniqueName="Delete" ButtonType="ImageButton" ConfirmText="آیا از حذف نمودن اطلاعات این شرکت مطمئن هستید?" ConfirmTitle="احتیاط"
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
