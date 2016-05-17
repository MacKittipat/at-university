<%--
    Document   : index
    Created on : 27 ส.ค. 2552, 12:30:13
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Doctor Appoint System</title>
        <link rel="shortcut icon" href="images/clock.ico" />
        <!---StyleSheet--->
        <link rel="stylesheet" href="script/style.css" />
        <!--[StyleSheet]-->
        <!---jQuery--->
        <script type="text/javascript" src="script/lib/jquery/jquery.js"></script>
        <!--[jQuery]-->
        <!---jQuery-LiveQuery--->
        <script type="text/javascript" src="script/lib/jquery/jquery-livequery.js"></script>
        <!--[jQuery-LiveQuery]-->
        <!---jQuery-Validate--->
        <script type="text/javascript" src="script/lib/jquery/jquery-validate.js"></script>
        <!--[jQuery-Validate]-->
        <!---jQuery-UI--->
        <link rel="stylesheet" href="script/lib/jquery-ui/jquery-ui.css" />
        <script type="text/javascript" src="script/lib/jquery-ui/jquery-ui.js"></script>
        <!--[jQuery-UI]-->
        <!--[AjaxUpload]-->
        <script type="text/javascript" src="script/lib/ajaxupload/ajaxupload.js"></script>
        <!---AjaxUpload--->
        <!---Script--->
        <script type="text/javascript" src="script/register.js"></script>
        <!--[Script]-->
        <!---Script Login--->
        <script type="text/javascript" src="script/component/login.js"></script>
        <!--[Script Login]-->
    </head>
    <body>
    	<!---Header--->
        <div class="header">
            <div class="logo">
                <%@include file="component/logo.jspf" %>
            </div>
            <div class="bg-header">
                <%@include file="component/bg-header.jspf" %>
            </div>
    	</div>
        <!--[Header]-->
        <br />
        <!---Content--->
        <div class="content">
            <!---LeftContent--->
            <div class="l-content">
                <!---Navigate--->
                <div class="navigate">
                    <jsp:include page="component/navigate.jsp"></jsp:include>
                </div>
                <!--[Navigate]-->
                <br />
                <!---Login--->
                <div class="login">
                    <jsp:include page="component/login.jsp"></jsp:include>
                </div>
                <!--[Login]-->
            </div>
            <!--[LeftContent]-->
            <!---RightContent--->
            <div class="r-content">
                <h2>
                    Register
                </h2>
                <div class="p-content">
                    <div style="color:red" id="usernamemsg"></div>
                    <form class="form-regis-user" action="#" method="post" enctype="multipart/form-data">
                        <table>
                            <tr>
                                <td>
                                    Email
                                </td>
                                <td>
                                    : <input type="text" id="txtEmail" name="txtEmail" />
                                </td>
                            </tr>
                            <tr>
                                <td width="150px">
                                    Username
                                </td>
                                <td width="200px">
                                    : <input type="text" id="txtUsernames" name="txtUsernames" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Password
                                </td>
                                <td>
                                    : <input type="password" id="txtPasswords" name="txtPasswords" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Confirm Password
                                </td>
                                <td>
                                    : <input type="password" id="txtConfirmPassword" name="txtConfirmPassword" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" id="btnContinue" value="Continue" />
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <!--[RightContent]-->
        </div>
        <!--[Content]-->
        <br />
        <!---Footer--->
        <div class="footer">
            <jsp:include page="component/footer.jsp"></jsp:include>
        </div>
        <!--[Footer]-->
     
    </body>
</html>
