<%@ Page Title="" Language="C#" MasterPageFile="~/Members/Members.master" AutoEventWireup="true" CodeBehind="AllBranches.aspx.cs" Inherits="UserLoginSystem.Members.AllBranches" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">
<telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="branchGrid">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="branchGrid"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
 <div  id="main_div3" class="main ui-widget-content" >
       <img id="pin" src="/Images/pin.png" />
        <telerik:RadGrid ID="branchGrid" AllowFilteringByColumn="True" AllowSorting="True"
            AllowPaging="True" Width="100%" PageSize="8" runat="server" AutoGenerateColumns="False"
            EnableLinqExpressions="false" OnSortCommand="branchGrid_SortCommand" OnPageIndexChanged="branchGrid_PageIndexChanged" OnDeleteCommand="branchGrid_DeleteCommand"
            OnPageSizeChanged="branchGrid_PageSizeChanged" OnNeedDataSource="branchGrid_NeedDataSource" EnableEmbeddedSkins="True" Skin="Vista" >
            <MasterTableView DataKeyNames="id,broker,name,city,address,tel" >
                <Columns >
                   
              
                    <telerik:GridBoundColumn UniqueName="id" DataField="id" HeaderText="شماره"   AllowFiltering="true"  >
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="broker" DataField="broker" HeaderText="نام کارگزاری"   AllowFiltering="false"  > 
                    </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn UniqueName="name" DataField="name" HeaderText="نام شعبه"   AllowFiltering="false"  > 
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="city" DataField="city" HeaderText="نام شهر"   AllowFiltering="false"  > 
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="address" DataField="address" HeaderText="آدرس"   AllowFiltering="false"  > 
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="tel" DataField="tel" HeaderText="تلفن"   AllowFiltering="false"  > 
                    </telerik:GridBoundColumn>
                    <telerik:GridHyperLinkColumn DataNavigateUrlFormatString="InsertBranches.aspx?tab1=tab_branch&tab2=newbranch&id={0}" DataNavigateUrlFields="id" ShowFilterIcon="false"
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
<script>
function runWhenDocIsReady() {
  
}
</script>
</asp:Content>
