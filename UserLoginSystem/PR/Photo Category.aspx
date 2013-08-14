<%@ Page Title="" Language="C#" MasterPageFile="PR.master" AutoEventWireup="true" CodeBehind="Photo Category.aspx.cs" Inherits="UserLoginSystem.PR.Photo_Category" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
 <%@ PreviousPageType VirtualPath="~/PR/InsertNews.aspx"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <style>
#icons {
		margin: 0;
		padding: 0;
	}
	#icons li {
		margin: 2px;
		position: relative;
		padding: 4px 0;
		cursor: pointer;
		float: left;
		list-style: none;
	}
	#icons span.ui-icon {
		float: left;
		margin: 0 4px;
		
	}       
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">
<div  id="main_div1" class="ui-widget-content ">
      <img id="pin" src="/Images/pin.png" />
      <iframe frameborder="0" 
        src="FileManager/Default.aspx?sessionid=<%= Session.SessionID %>" 
        style="height: 650px; width: 950px">


</iframe>
</div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
<script type="text/javascript">
    function runWhenDocIsReady() {

        $("#items").removeClass("ui-selectee ui-selected");
        $('#items').live('selectstart dragstart', function (evt) { evt.preventDefault(); return false; });
      

       }

       </script>
</asp:Content>
