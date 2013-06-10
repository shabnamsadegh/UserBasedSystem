<%@ Page Title="" Language="C#" MasterPageFile="PR.Master" AutoEventWireup="true" CodeBehind="InsertNews.aspx.cs" Inherits="CustomWebControlUI.Default"  ValidateRequest="false" %>
<%@ Register Assembly="Heidarpour.WebControlUI" Namespace="Heidarpour.WebControlUI"
    TagPrefix="rhp" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server"> 

 <link href="../Styles/news.css" rel="stylesheet" type="text/css" />
   <%--<script src="Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>--%>
   <style type="text/css">
   .compared{background-color:#e2d9dc;border:1px solid #9b9b9b;margin-left:10px;-webkit-border-radius:4px;-moz-border-radius:4px;border-radius:4px;float:right;margin-top:5px;padding:0 5px;} 
  #comparePanel{border:1px solid #bbbbbb; background-color:White;padding:px;}
   </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainPlaceHolder" runat="server">
<div id="error" class="err"></div>
<%--    <form runat="server">--%>
    <div  class="main_div">
      <img id="pin" src="../Images/pin.png" />
        <table id="main">
        <tr>
                <td><asp:Label ID="lbldate" runat="server" Text="تاریخ"></asp:Label></td>
                <td> 
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                
                <rhp:DatePicker ID="DatePicker1" runat="server" DatePersian="1391/07/14" CalendarType="Persian"
                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" ShowWeekNumbers="True"
                        ReadOnly="True" FirstDayOfWeek="Monday" ShowOthers="True" 
                        onclose="onClose" OnUpdate="onUpdate"></rhp:DatePicker></td>
                        <td ><asp:Label ID="lblTime" runat="server" Text="زمان"></asp:Label></td>
                        <td >                 
                             <asp:TextBox ID="txtTime" name="txtTime" class="clsTime" runat="server" onchange="javascript:change_warning_status('time');" >
                             </asp:TextBox>
                            </td>
            <td><asp:Label ID="Label1" runat="server" Text="انتشار"></asp:Label></td><td><asp:CheckBox ID="CheckBox1" runat="server" /></td>
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
                <td colspan="5"><asp:TextBox ID="txtNewsSummery" runat="server" TextMode="MultiLine" class="fullWidth"
                        Height="70px" onkeyup="javascript:change_warning_status('summery');"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblNewsImage" runat="server" Text="تصویر"></asp:Label></td>
                <td colspan="5"><asp:FileUpload ID="ImageUploader" runat="server" /></td>
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
                                DataTextField="SymName" AllowCustomText="false" MarkFirstMatch="true" DataValueField="SymId">
                            </telerik:RadComboBox>
                            <img src="../Images/Add.png?1" width="16px" height="16px" style="cursor: pointer; margin-right: 5px;"
                                onclick="AddComparingSymbol()" /><br />
                            
                        </div>
                        </td></tr>
            <tr>
                <td><asp:Label ID="lblNewsResourse" runat="server" Text="منبع خبر"></asp:Label></td>
                <td colspan="5"><asp:TextBox ID="txtNewsResource" runat="server" class="fullWidth"></asp:TextBox></td>
            </tr>
            <tr class="submit">
                <td colspan="6" class="submit">
                    <asp:ImageButton ID="btnSubmit1" runat="server" 
                        ImageUrl="~/Images/send.png" onclick="btnSubmit1_Click1" OnClientClick="MakeSybolsString();"></asp:ImageButton></td>
            </tr>
        </table>

          <input type="hidden" id="err_time" value="false"/>
        <input type="hidden" id="title1" value="false" />
        <input type="hidden" id="summery" value="false" />
        <input type="hidden" id="body" value="false" />
        <input type="hidden" id="symbols" value="" runat="server" />
        <input type="hidden" id="symbolNames" value="" runat="server" />
<%-- </form>--%>
    <br />
   
 

    
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
     
     <script type="text/javascript" src="../tiny_mce/tiny_mce.js"></script>
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
<script type="text/javascript">
    
   
</script>
    <script type="text/javascript">
          function  runWhenDocIsReady() {
             $("head").append("<link>");
             css = $("head").children(":last");
            css.attr({
                 rel: "stylesheet",
                 type: "text/css",
                 href: "../Styles/theme.css"
                         });

             change_warning_status("");
             loadSymbols();
             }
        
             function change_warning_status(mode) {
                 if ($("#err_time").val() == "false" && $("#title1").val() == "false" && $("#summery").val() == "false" && $("#body").val() == "false") {
                     $(".err").hide();
                    // alert("hi");
                 }
                 else {
                     $(".err").show();
                    // alert("by");
                 }
                 if (mode == "time") {

                     var txt = $("#<%= txtTime.ClientID %>").val();
                     var rege = /^([0-9]|0[0-9]|1[0-9]|2[0-3])\:[0-5][0-9]$/;
                     if (!rege.test(txt)) {
                         //$('.test:not(:has(img))')
                         $(".err:not(:has(#p_err_time))").append('<p class="inner_err" id="p_err_time">لطفا تاریخ را به درستی وارد کنید</p>');
                         $("#err_time").attr("value", "true");
                     }
                     else {
                         $("#err_time").attr("value", "false");
                         $('#p_err_time').remove();
                     }
                 }
                 if (mode == "title1") {
                     if ($("#<%= txtTitle1.ClientID %>").val() == "") {
                         $(".err:not(:has(#p_err_title1))").append('<p class="inner_err" id="p_err_title1">لطفا تیتر اول را پر کنید</p>');
                         $("#title1").attr("value", "true");
                     } else {
                         $("#title1").attr("value", "false");
                         $('#p_err_title1').remove();
                     }
                 }
                 if (mode == "summery") {
                     if ($("#<%= txtNewsSummery.ClientID %>").val() == "") {

                         $(".err:not(:has(#p_err_summery))").append('<p class="inner_err" id="p_err_summery">لطفا خلاصه خبر را پر کنید</p>');
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
                         $(".err:not(:has(#p_err_body))").append('<p  class="inner_err" id="p_err_body">لطفا متن خبر را پر کنید</p>');
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
         var symbols1 = [];
      function DeleteComparingSymbol(object,id) {
           // console.log("%o",$(object).parent());
          var index = symbols1.indexOf(id.toString());
          symbols1.splice(index, 1);
          
            $(object).parent().remove();
            
            console.log(symbols1);
            if($("#comparePanel").children().length==3){
               // $("#CompareChart").empty();
               
            }else{
                var symbols =[],
                contains=$("#comparePanel .compared");
                $.each(contains,function(ci){symbols.push([$(contains[ci]).attr("symId"),$(contains[ci])[0].innerText]);});
                //symbols.push([selectedSymbolId,combo.get_text()]);
             //   prepareCompareChartData(symbols);
            }
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
            $("#comparePanel").append("<div class='compared' symId='" + selectedSymbolId + "'>" + combo.get_text() + "<img  src='../Images/Del.png?1' width='10px' hight='10px' style='margin-right:10px;cursor:pointer;' onClick='DeleteComparingSymbol(this," + selectedSymbolId + ")'/></div>");
            symbols1.push(selectedSymbolId);
            var symbols = [],
            contains = $("#comparePanel .compared");
            $.each(contains, function (ci) { symbols.push([$(contains[ci]).attr("symId"), $(contains[ci])[0].innerText]); });
        }
        function MakeSybolsString() {
            var symbol_str = "";
            $.each(symbols1, function (i) {
                symbol_str = symbol_str + "." + symbols1[i];
            });
            $("#<%= symbols.ClientID %>").attr("value", symbol_str);

        }
        function loadSymbols() {
            var symbolStr = $("#<%= symbols.ClientID %>").val();
            var symbolName = $("#<%= symbolNames.ClientID %>").val();
            var symbolNames = [];
            if (symbolStr != "") {
                symbols1 = symbolStr.split(".");
            }
            if(symbolName != "")
            {
                symbolNames = symbolName.split(".");
              //  symbolNames = symbolNames.reverse();
            }
            //            var combo = $find("<%= RadComboBox1.ClientID %>");
            var combo = <%=RadComboBox1.ClientID %>;
            var selectedSymbolId;
            var selectedSymbolName;
            //var size = symbolNames.length;
            var index = symbolNames.indexOf("");
            symbolNames.splice(index, 1);

            var index = symbols1.indexOf("");
            symbols1.splice(index, 1);

            $.each(symbols1, function (i) {
              
                   console.log("i:" + i );
                   console.log("symbols: ");
                   console.log(symbols1[i]);
                   console.log("texts: ");
                   console.log(symbolNames[i]);
                    selectedSymbolId = symbols1[i];
                    selectedSymbolName = symbolNames[i];
                    console.log("%o" ,combo);
                    //combo.SetValue(selectedSymbolId);
                    $("#comparePanel").append("<div class='compared' symId='" + selectedSymbolId + "'>" + selectedSymbolName + "<img  src='../Images/Del.png?1' width='10px' hight='10px' style='margin-right:10px;cursor:pointer;' onClick='DeleteComparingSymbol(this," + selectedSymbolId + ")'/></div>");
                
            });
         }
     </script>
</asp:Content>