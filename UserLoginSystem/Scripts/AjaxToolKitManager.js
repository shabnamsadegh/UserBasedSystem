
function showImgManager() {
    $("#divImgManager").html("&nbsp;&nbsp;image url : <input style='width:200px' id='txtImgurl' type='text' /> &nbsp;&nbsp; <a onclick='openFileManager();' href='javascript:;'  border='0' title='Browse server' ><img alt='Browse server' src='/FileManager/icons/server-files.png' border='0' width='15px' hight='15px' /></a> &nbsp;&nbsp; <a onclick='InsertImage();' href='javascript:;'>insert image</a> <a onclick='hideImgManager();' style='float:right;' border='0' href='javascript:;'><img  border='0' src='/FileManager/icons/gtk_close.png' /></a>");
    $("#divImgManager").show();
}

function hideImgManager() {
    $("#divImgManager").hide();
}

function showFileManager() {
    $("#divImgManager").html("&nbsp;&nbsp;File url : <input style='width:200px' id='txtImgurl' type='text' /> &nbsp;&nbsp; Link Title : &nbsp;&nbsp; <input style='width:200px' id='txtlinktitle' type='text' /> <a onclick='openFileManager();' border='0' title='Browse server' href='javascript:;' ><img alt='Browse server'  border='0' width='15px' hight='15px' src='/FileManager/icons/server-files.png' /></a> &nbsp;&nbsp; <a onclick='InsertFile();' href='javascript:;'>insert file</a> <a onclick='hideImgManager();' style='float:right;' border='0' href='javascript:;'><img  border='0' src='/FileManager/icons/gtk_close.png' /></a>");
    $("#divImgManager").show();
}



function InsertFile() {

    var ImgURL = $("#txtImgurl").val();
    var LinkTitle = $("#txtlinktitle").val();
    var EditFrame = $(".ajax__htmleditor_editor_editpanel div iframe").attr("id");
    var Selected = "";

    try {

        eval("Selected = " + EditFrame + ".document.selection.createRange().text;");
    }
    catch (e) {
        eval("Selected = " + EditFrame + ".getSelection();");
    }
    eval(EditFrame + ".focus()");
    if (Selected != "") {
        eval(EditFrame + ".document.execCommand('CreateLink', false, '" + ImgURL + "')");
    }
    else {
        try {

            eval(EditFrame + ".document.selection.createRange().pasteHTML('<a href=" + ImgURL + ">" + LinkTitle + "</a>')");
        }
        catch (e) {
            eval("var range = " + EditFrame + ".getSelection().getRangeAt(0); range.deleteContents(); var NewLink = document.createElement('a'); NewLink.href='" + ImgURL + "'; NewLink.innerHTML ='" + LinkTitle + "'; range.insertNode(NewLink);");
        }
    }
    eval(EditFrame + ".focus()");
    hideImgManager();
}

function InsertImage() {
    var ImgURL = $("#txtImgurl").val();
    var EditFrame = $(".ajax__htmleditor_editor_editpanel div iframe").attr("id");
    eval(EditFrame + ".focus()");
    eval(EditFrame + ".document.execCommand('InsertImage', false, '" + ImgURL + "')");
    hideImgManager();
    eval(EditFrame + ".focus()");
}