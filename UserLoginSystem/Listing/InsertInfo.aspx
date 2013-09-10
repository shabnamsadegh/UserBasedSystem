<%@ Page Title="" Language="C#" MasterPageFile="~/Listing/Listing.master" AutoEventWireup="true" CodeBehind="InsertInfo.aspx.cs" Inherits="UserLoginSystem.Listing.InsertInfo" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">

 <div  id="main_div3" class="ui-widget-content ">
      <img id="pin" src="/Images/pin.png" />
        <table id="main3" >
        <tr>
            <td>
                <asp:Label ID="lblInstrument" runat="server" Text="اسم شرکت"></asp:Label></td>
            <td>
             <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                <telerik:RadComboBox ID="RadComboBoxInstrument" runat="server" Width="150" Height="140" EmptyMessage="شرکت ها"
                                DataTextField="instruTitle" AllowCustomText="false" MarkFirstMatch="true" DataValueField="instruID" >
                            </telerik:RadComboBox>
             </td>
         </tr>
         <tr>
            <td><asp:Label ID="lblAddress" runat="server" Text="آدرس"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" Height="73px" TextMode="MultiLine" 
                    Width="213px"></asp:TextBox>
            </td>
         </tr>
         <tr>
            <td><asp:Label ID="lblEmail" runat="server" Text="پست الکترونیکی"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="213px"></asp:TextBox>
            </td>
         </tr>
<tr>
            <td><asp:Label ID="lblTel" runat="server" Text="تلفن"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtTel" runat="server" Width="213px"></asp:TextBox>
            </td>
         </tr>
<tr>
            <td><asp:Label ID="lblBoss" runat="server" Text="مدیر عامل"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtBoss" runat="server" Width="213px"></asp:TextBox>
            </td>
         </tr>
<tr>
            <td><asp:Label ID="lblSite" runat="server" Text="وبسایت"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtSite" runat="server" Width="213px"></asp:TextBox>
            </td>
         </tr>


         <tr><td colspan="2" align="left">
             <asp:Button ID="btnInsert" runat="server" Text="ثبت" 
                 onclick="btnInsert_Click" />
         </td></tr>
        </table>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
  
<script type="text/javascript">
    function runWhenDocIsReady() {
        $("#<%= btnInsert.ClientID %>").button();

    }
</script>
</asp:Content>
