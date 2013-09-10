<%@ Page Title="" Language="C#" MasterPageFile="~/Members/Members.master" AutoEventWireup="true" CodeBehind="InsertBranches.aspx.cs" Inherits="UserLoginSystem.Members.InsertBranches" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">

 <div  id="main_div3" class="ui-widget-content ">
      <img id="pin" src="/Images/pin.png" />
        <table id="main3" >
        <tr>
            <td>
                <asp:Label ID="lblname" runat="server" Text="نام کارگزاری"></asp:Label></td>
            <td>
                <asp:DropDownList ID="comboBroker" runat="server">
                </asp:DropDownList>
                
             </td>
         </tr>
         <tr>
            <td><asp:Label ID="lblBranchName" runat="server" Text="نام شعبه"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtBranchName" runat="server"></asp:TextBox>
            </td>
         </tr>
          <tr>
            <td>
                <asp:Label ID="lblCity" runat="server" Text="شهر"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ComboCity" runat="server">
                </asp:DropDownList>
                
             </td>
         </tr>
          <tr>
            <td><asp:Label ID="lblAddress" runat="server" Text="آدرس"></asp:Label></td>
            <td>
                <asp:TextBox ID="Txtaddress"   runat="server" TextMode="MultiLine" 
                    Height="78px" Width="237px"></asp:TextBox>
            </td>
         </tr>
          <tr>
            <td><asp:Label ID="lblTel" runat="server" Text="تلفن"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtTel" Width="174px" runat="server"></asp:TextBox>
            </td>
         </tr>
         <tr>
         <td colspan="2" align="center" style="color:Red;"><asp:Label ID="lblMesssage" runat="server" Text=""></asp:Label></td>
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
