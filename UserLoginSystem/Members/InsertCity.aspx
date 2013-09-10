<%@ Page Title="" Language="C#" MasterPageFile="~/Members/Members.master" AutoEventWireup="true" CodeBehind="InsertCity.aspx.cs" Inherits="UserLoginSystem.Members.InsertCity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">

 <div  id="main_div3" class="ui-widget-content ">
      <img id="pin" src="/Images/pin.png" />
        <table id="main3" >
        <tr>
            <td>
                <asp:Label ID="lblState" runat="server" Text="استان"></asp:Label></td>
            <td>
                <asp:DropDownList ID="comboState" runat="server">
                </asp:DropDownList>
             </td>
         </tr>
         <tr>
            <td><asp:Label ID="lblCity" runat="server" Text="شهر"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
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
