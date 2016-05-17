<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- jQuery -->
        <script src="lib/jquery/jquery.autotab.js" type="text/javascript"></script>
        <!-- ****** -->
        <!-- Validate -->
        <script src="lib/pages/validate_forgot.js" type="text/javascript"></script>
        <!-- ****** -->
        <title>Forgot Password</title>
    </head>
    <body>
<table id ="mainForm" align ="center" width="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
    <td>
        <div id ="forgotForm" align ="center" class="ui-state-default">
            <table align="center">
                <tr>
                    <td align="right">
                        Username :
                    </td>
                    <td>
                        <input type ="text" id ="txtUsername" />
                        <span id ="userCheck" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Email :
                    </td>
                    <td>
                        <input type ="text" id ="txtEmail" />
                        <span id ="emailCheck" />
                    </td>
                </tr>
                <tr>
                    <td colspan ="2">
                        <input type ="image" id ="btnSubmit" src ="images/btn_submit.png" />
                    </td>
                </tr>
            </table>
        </div>
        <div id ="forgotWait" style ="display:none;" align="center" class="ui-state-default">
                Now Sending Data <br />
                <span id="loading"></span>
        </div>
        <div id ="forgotSuccess" style ="display:none;" align="center" class="ui-state-default">
                Thank you for Registration.<br />
                Please Activate Your Username in Email.<br />
        </div>
        <div id ="forgotError" style ="display:none;" align="center" class="ui-state-default">
                Registration Fail.<br />
                Try Again !.<br />
        </div>
        </td>
    </tr>
</table>
    </body>
</html>
