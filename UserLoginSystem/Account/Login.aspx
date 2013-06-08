<%@ Page Title="ورود به سیستم" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="UserLoginSystem.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
   
</asp:Content>
<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="MainPlaceHolder">
    <div class="CenterContent">
        <asp:Login OnLoggedIn="LoginUser_OnLoggedIn" ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false" FailureText="رمز عبور یا کلمه کاربری صحیح نمی باشد." DestinationPageUrl="" >
            <LayoutTemplate>
                <span class="failureNotification">
                    <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                </span>
                <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                    ValidationGroup="LoginUserValidationGroup" />
                <div class="accountInfo">
                    <fieldset class="login">
                        <legend>اطلاعات کاربری</legend>
                        <p>
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">نام کاربری:</asp:Label>
                            <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                CssClass="failureNotification" ErrorMessage="نام کاربری خود را وارد نمایید."
                                ToolTip="نام کاربری خود را وارد نمایید." ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">رمز ورود:</asp:Label>
                            <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                CssClass="failureNotification" ErrorMessage="رمز عبور خود را وارد نمایید." ToolTip="رمز عبور خود را وارد نمایید."
                                ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                        </p>
                    </fieldset>
                    <p class="submitButton">
                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup" />
                    </p>
                </div>
            </LayoutTemplate>
        </asp:Login>
    </div>
</asp:Content>
