<%@ Page Title="" Language="C#" MasterPageFile="PR.Master" AutoEventWireup="true" CodeBehind="InsertNews.aspx.cs" Inherits="CustomWebControlUI.Default"  ValidateRequest="false" %>
<%@ Register Assembly="Heidarpour.WebControlUI" Namespace="Heidarpour.WebControlUI"
    TagPrefix="rhp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server"> 

<link href="/Styles/jqueryFileTree.css" rel="Stylesheet" />
   <%--<script src="Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>--%>
   <style type="text/css">
   .compared{background-color:#bfdadd;border:1px solid #9b9b9b;margin-left:10px;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;float:right;margin-top:5px;padding:0 5px;} 
  #comparePanel{border:1px solid #bbbbbb; background-color:White;padding:px;}
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
	#iconImg {
		margin: 0;
		padding: 0;
	}
	#iconImg li {
		margin: 2px;
		position: relative;
		padding: 4px 0;
		cursor: pointer;
		float: left;
		list-style: none;
	}
	#iconImg span.ui-icon {
		float: left;
		margin: 0 4px;
	}  
	
	.innerForm
{
 width:40%;
 height:420px; 
 position:relative;
 }

     
 .cmForm
  {
      position:fixed;
      top:0;
      left:0;
      right:0;
      bottom:0;
      background-color:rgba(0, 0, 0, 0.72);
      z-index:3000;
      display:none;
      }
      
      
  .innerForm
{
 background-color:White;
 width:40%;
 margin: auto;
 margin-top: 200px;
 -webkit-border-radius:15px;
 -moz-border-radius:15px;
 border-radius:15px;  
 height:420px; 
 position:relative;
 
 }
 .innerForm #del
 {
  cursor:pointer !important;
vertical-align: top;
padding:12px;
}
   #btndel
   {
    cursor:pointer !important;
    margin:6px;
   }
      area
      {
          border:1px solid black;
      }
 .thumbnail
 {
  width: 60px;
   height:60px;
  /* display:inline-block;*/
   margin:10px;
   border:2px solid #00CCFF;
        }
    #galleryInnerForm  
    {
    direction:ltr;
    overflow:scroll;
    padding: 4px;
    }
   .imageBorder {
    border-style: double;
    padding: 16px;
    background-color: #DCDCED;
    }
    .im
    {
        margin-left: -5px !important;
        width:25px;
        height:25px;
        margin-top:-8px;
        display:inline-block;
        }
        #icons
        {
            display:inline-block;
            }
   </style>

   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">


 
<div class="ui-widget" id="error_box">
	<div id="error" class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;">	
	</div>
</div>
<%--    <form runat="server">--%>


    <div  id="main_div" class="ui-widget-content ">
      <img id="pin" src="/Images/pin.png" />
        <table id="main" >
        <tr>
                <td><asp:Label ID="lbldate" runat="server" Text="تاریخ"></asp:Label></td>
                <td> 
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                
                <rhp:DatePicker ID="DatePicker1" runat="server" DatePersian="1391/07/14" CalendarType="Persian"
                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" ShowWeekNumbers="True"
                        ReadOnly="True" FirstDayOfWeek="Monday" ShowOthers="True" 
                        onclose="onClose" OnUpdate="onUpdate" ></rhp:DatePicker></td>
                        <td ><asp:Label ID="lblTime" runat="server" Text="زمان"></asp:Label></td>
                        <td >                 
                             <asp:TextBox ID="txtTime" name="txtTime" class="clsTime" runat="server" onchange="javascript:change_warning_status('time');" >
                             </asp:TextBox>
                            </td>
            <td><asp:Label ID="Label1" runat="server" Text="انتشار"></asp:Label></td><td><asp:CheckBox ID="chkPublish" runat="server" /></td>
            </tr>
           <tr><td colspan="6"></td></tr>
            <tr>
                <td><asp:Label ID="lblDescTitle" runat="server" Text="رو تیتر"></asp:Label></td>
                <td colspan="5"><asp:TextBox ID="txtDescTitle" runat="server" class="fullWidth"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblTitle1" runat="server" Text="تیتر اول"></asp:Label></td>
                <td colspan="5"><asp:TextBox ID="txtTitle1" runat="server" class="fullWidth" onkeyup="javascript:change_warning_status('title1');"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblTitle2" runat="server" Text="تیتر دوم"></asp:Label></td>
                <td colspan="5"><asp:TextBox ID="txtTitle2" runat="server" class="fullWidth"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblNewsSummery"  runat="server" Text="خلاصه خبر"></asp:Label></td>
                <td colspan="5"><asp:TextBox ID="txtNewsSummery" name="txtNewsSummery"
                 runat="server" TextMode="MultiLine" class="fullWidth"
                        Height="70px" onkeyup="javascript:change_warning_status('summery');"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblNewsImage" runat="server" Text="تصویر"></asp:Label></td>
                <td colspan="4">
                 <ul id="iconImg" class="ui-widget ui-helper-clearfix" style="display:inline-block">
                            	<li class="ui-state-default ui-corner-all" title="رفتن به گالری"><span class="ui-icon ui-icon-image"  onclick="OpenGallery();" ></span></li>
                                <li class="ui-state-default ui-corner-all" title="حذف تصویر"><span class="ui-icon ui-icon-close"  onclick="DeleteImage();" ></span></li>
                                <li class="ui-state-default ui-corner-all" title="اضافه کردن تصویر"><span class="ui-icon ui-icon-plus"  onclick="OpenImageChooser();" ></span></li>
                              
                                
                            </ul>
                                       <%-- <asp:Button class="im" ID="btnGoToGallery" runat="server" type="submit" OnClick="btnGoToGallery_Click"/>--%>
                </td>
                <td>
                <img class="imageBorder" id="newsImage" src="/Images/no-image.jpg"  style="width:60px;height:60px"/>
                
                </td>
                
            </tr>
            <tr>
                <td><asp:Label ID="lblNewsBody" runat="server" Text="متن خبر"></asp:Label></td>
                <td colspan="5"><asp:TextBox ID="txtNewsBody" runat="server" TextMode="MultiLine" Height="300px" Width="652px" class="newsBody" onkeyup="javascript:change_warning_status('body');"></asp:TextBox>
                </td>
            </tr>
            <tr>
         <td><asp:Label ID="lblSymbol" runat="server" Text="نماد های مرتبط"></asp:Label></td>
            <td colspan="5" id="comparePanel">
             <div >
                        
                            <telerik:RadComboBox ID="RadComboBox1" runat="server" Width="80" Height="140" EmptyMessage="نماد ها"
                                DataTextField="SymName" AllowCustomText="false" MarkFirstMatch="true" DataValueField="SymId" >
                            </telerik:RadComboBox>
                            <ul id="icons" class="ui-widget ui-helper-clearfix" style="display:inline-block">
                            	<li class="ui-state-default ui-corner-all" title="اضافه کردن نماد"><span class="ui-icon ui-icon-plus"  onclick="AddComparingSymbol()" ></span></li>
                            </ul>
                         
 <%--
                            <img src="../Images/Add.png?1" width="16px" height="16px" style="cursor: pointer; margin-right: 5px;"
                               /><br />--%>
                            
                        </div>
                        </td></tr>
            <tr>
                <td><asp:Label ID="lblNewsResourse" runat="server" Text="منبع خبر"></asp:Label></td>
                <td colspan="5"><asp:TextBox ID="txtNewsResource" runat="server" class="fullWidth"></asp:TextBox></td>
            </tr>
            <tr class="submit">
              
                <td colspan="6" class="submit">
                  <asp:Button ID="Button2" runat="server" Text="ثبت خبر" onclick="btnSubmit_Click" />
                 </td>
            </tr>
        </table>

        <input type="hidden" id="err_time" value="false"/>
        <input type="hidden" id="title1" value="false" />
        <input type="hidden" id="summery" value="false" />
        <input type="hidden" id="body" value="false" />
        <input type="hidden" id="image_src" runat="server" value="/Images/no-image.jpg" />

        <asp:HiddenField ID="symbols" runat="server" Value=""/>
        <asp:HiddenField ID="symbolNames" runat="server" Value=""/>
    
<%-- </form>--%>
    <br />
<%-- INNER FORM FOR GALLERY--%>
 <div class="cmForm" id="galleryForm">
        <div class="innerForm" id="galleryInnerForm">
            <img src="/Images/Del.png" id="btndel" onclick='$(this).parent().parent().fadeOut("slow");'/>
           <div id="galleryInnerFormTree"></div>
            </div></div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptPlaceHolder" runat="server">
    <script type="text/javascript">

    function onSelect(calendar, date) {
        // Beware that this function is called even if the end-user only
        // changed the month/year. In order to determine if a date was
        // clicked you can use the dateClicked property of the calendar:
        if (calendar.dateClicked) {
            var msg =
                        "<br/>Persian: Year: " + calendar.date.getJalaliFullYear() +
                        ", Month: " + (calendar.date.getJalaliMonth() + 1) +
                        ", Day: " + calendar.date.getJalaliDate() +
                        "<br/>Gregorian: Year: " + calendar.date.getFullYear() +
                        ", Month: " + calendar.date.getMonth() +
                        ", Day: " + calendar.date.getDate();

            $("#<%= DatePicker1.ClientID %>").val(date);
            logEvent("onSelect Event: <br> Selected Date: " + date + msg);
            calendar.hide();
            //calendar.callCloseHandler(); // this calls "onClose"
        }
    };

    function onUpdate(calendar) {
        var msg =
                    "<br/>Persian: Year: " + calendar.date.getJalaliFullYear() +
                    ", Month: " + (calendar.date.getJalaliMonth() + 1) +
                    ", Day: " + calendar.date.getJalaliDate() +
                    "<br/>Gregorian: Year: " + calendar.date.getFullYear() +
                    ", Month: " + calendar.date.getMonth() +
                    ", Day: " + calendar.date.getDate();

        logEvent("onUpdate Event: <br> Selected Date: " + calendar.date.print('%Y/%m/%d', 'jalali') + msg);
    };

    function onClose(calendar) {
        logEvent("onClose Event");
        calendar.hide();
    };

    function logEvent(str) {
        $("#log").append("<li>" + str + "</li>");
    }
    </script>
     
     <script type="text/javascript" src="/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript">
    tinymce.init({
        selector: "textarea.newsBody",
        plugins : "autolink,lists,spellchecker,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

        // Theme options
        theme_advanced_buttons1 : "bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,formatselect,fontsizeselect",
        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,|,preview,|,forecolor,backcolor",
        theme_advanced_buttons3 : "tablecontrols,|,sub,sup,|,charmap,|,print,|,ltr,rtl,|,fullscreen",
        theme_advanced_buttons4 : "",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_statusbar_location : "bottom",
        theme_advanced_resizing : true,
        // Skin options
        skin: "o2k7",
        skin_variant: "silver",

        

        // Drop lists for link/image/media/template dialogs
        template_external_list_url: "js/template_list.js",
        external_link_list_url: "js/link_list.js",
        external_image_list_url: "js/image_list.js",
        media_external_list_url: "js/media_list.js",

     
    });
</script>
<script type="text/javascript" src="/Scripts/jqueryFileTree.js">
    
   
</script>
    <script type="text/javascript">
        function runWhenDocIsReady() {
           // $("#__VIEWSTATE").remove();
            var url_for_load_image = $("#<%= image_src.ClientID %>").val();
            $("#newsImage").attr("src", url_for_load_image);
             $("head").append("<link>");
             css = $("head").children(":last");
            css.attr({
                 rel: "stylesheet",
                 type: "text/css",
                 href: "../Styles/theme.css"
                         });
                         $('#galleryInnerFormTree').fileTree({ root: '/PR/FileManager/UserFiles/' }, function (file) {
                             var str_file = file.toString();
                             $("#galleryForm").fadeOut("slow");
                             $("#newsImage").attr("src", str_file);
                             $("#<%= image_src.ClientID %>").attr("value", str_file);
                         });
             change_warning_status("");
             loadSymbols();
            // $("#tabs").tabs();
             //$("#tab1").addClass("ui-state-default ui-corner-top ui-tabs-active ui-state-active");
             $("#<%= Button2.ClientID %>").button();
       
            
//$('input.im').each(function () {
           //      $(this).replaceWith('<button style="width:25px;height:25px;text-align:center" class="im" type="' + $(this).attr('type') + '">' + $(this).val() + '</button>');
           //  });
             $('.im').button({ icons: { primary: 'ui-corner-all ui-icon-image'} });

             $("#icons li").hover(
			function () {
			    $(this).addClass("ui-state-hover");
			},
			function () {
			    $(this).removeClass("ui-state-hover");
			}
		);


			$("#iconImg li").hover(
			function () {
			    $(this).addClass("ui-state-hover");
			},
			function () {
			    $(this).removeClass("ui-state-hover");
			}
		);
           //  var x = $("#Button2").css("text");
             //alert(x);
             }
             function OpenImageChooser() {
                 $("#galleryForm").fadeIn("slow");
             }
             function OpenGallery() {
                 $("<div>در حال حاضر این قسمت آماده نمی باشد</div>").dialog({modal:true});
    
             }
             function DeleteImage() {
                 $("#newsImage").attr("src", "/Images/no-image.jpg");
             }
             function change_warning_status(mode) {
                 if ($("#err_time").val() == "false" && $("#title1").val() == "false" && $("#summery").val() == "false" && $("#body").val() == "false") {
                     $("#error").hide();
                     $("#error").css("display", "none");
                    // alert("hi");
                 }
                 else {
                     $("#error").show();
                     $("#error").css("display", "block");
                    // alert("by");
                 }
                 if (mode == "time") {

                     var txt = $("#<%= txtTime.ClientID %>").val();
                     var rege = /^([0-9]|0[0-9]|1[0-9]|2[0-3])\:[0-5][0-9]$/;
                     if (!rege.test(txt)) {
                         //$('.test:not(:has(img))')
                         $("#error:not(:has(#p_err_time))").append("<p id='p_err_time'><span  class='ui-icon ui-icon-info' style='float: right; margin-right: .3em;'></span>لطفا زمان را به درستی وارد کنید</p>");
                         $("#err_time").attr("value", "true");
                     }
                     else {
                         $("#err_time").attr("value", "false");
                         $('#p_err_time').remove();
                     }
                 }
                 if (mode == "title1") {
                     var x = $("#error #p_err_title1");
                   //  alert(x.length);
                     
                     if ($("#<%= txtTitle1.ClientID %>").val() == "") {
                         $("#error:not(:has(#p_err_title1))").append("<p id='p_err_title1'><span  class='ui-icon ui-icon-info' style='float: right; margin-right: .3em;'></span>لطفا تیتر اول را پر کنید</p>");
                         
                         $("#title1").attr("value", "true");
                     } else {
                         $("#title1").attr("value", "false");
                         $('#p_err_title1').remove();
                     }
                 }
                 if (mode == "summery") {
                     if ($("#<%= txtNewsSummery.ClientID %>").val() == "") {

                         $("#error:not(:has(#p_err_summery))").append("<p id='p_err_summery'><span  class='ui-icon ui-icon-info' style='float: right; margin-right: .3em;'></span>لطفا خلاصه خبر را پر کنید</p>"); 
                         $("#summery").attr("value", "true");
                     }
                     else {
                         $("#summery").attr("value", "false");
                         $('#p_err_summery').remove();
                     }
                 }
                 if (mode == "body") {
                     alert($("#<%= txtNewsBody.ClientID %>").val());
                     if ($("#<%= txtNewsBody.ClientID %>").val() == "") {
                         $("#error:not(:has(#p_err_body))").append("<p id='p_err_body'><span  class='ui-icon ui-icon-info' style='float: right; margin-right: .3em;'></span>لطفا متن خبر را پر کنید</p>");
                         
                         $("#body").attr("value", "true");
                     }
                     else {
                         $("#body").attr("value", "false");
                         $('#p_err_body').remove();
                     }
                 }
             }

     </script>
     <script type="text/javascript">
         function DeleteComparingSymbol(object, id) {
             $(object).parent().remove();
             RefreshSymbolsInput();
         }
         function AddComparingSymbol() {

             var combo = $find("<%= RadComboBox1.ClientID %>");
             var selectedSymbolId = combo.get_value();
             if (!selectedSymbolId) {
                 return;
             }

             if ($("#comparePanel .compared[symId='" + selectedSymbolId + "']").length > 0) {
                 alert("نماد مورد نظر قبلا وارد شده است");
                 return;
             }

             AddToComparePanel(selectedSymbolId, combo.get_text());
             RefreshSymbolsInput();
         }
         function RefreshSymbolsInput() {
             contains = $("#comparePanel .compared");
             var symbol_str = "", symbolname_str = "";
             $.each(contains, function (ci) { symbol_str += $(contains[ci]).attr("symId") + '.'; symbolname_str += $(contains[ci])[0].innerText + '.'; });
             if (contains.length > 0) {
                 symbol_str = symbol_str.substr(0, symbol_str.length - 1);
                 symbolname_str = symbolname_str.substr(0,symbolname_str.length - 1);
             }
                 
             $("#<%= symbols.ClientID %>").attr("value", symbol_str);
             $("#<%= symbolNames.ClientID %>").attr("value", symbolname_str);
             console.log('%o', $("#<%= symbols.ClientID %>").val());
             console.log('%o', $("#<%= symbolNames.ClientID %>").val());
             
         }
         function AddToComparePanel(id,text) {
             $("#comparePanel").append("<div class='compared' symId='" + id + "'>" + text + "<img  src='../Images/Del.png?1' width='10px' hight='10px' style='margin-right:10px;cursor:pointer;' onClick='DeleteComparingSymbol(this," + id + ")'/></div>");
         }
         function loadSymbols() {
             if ($("#<%= symbols.ClientID %>").val() != "") {
                 var symbolStr = $("#<%= symbols.ClientID %>").val().split(".");
                 var symbolName = $("#<%= symbolNames.ClientID %>").val().split(".");
                 $.each(symbolStr, function (i) {
                     AddToComparePanel(symbolStr[i], symbolName[i]);
                 });
             }
         }
      

     </script>

</asp:Content>