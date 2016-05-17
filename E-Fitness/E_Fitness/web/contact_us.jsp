<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <!-- jQuery -->
            <script src="lib/jquery/jquery.autotab.js" type="text/javascript"></script>
        <!-- ****** -->
        <!-- Validate -->
            <script src="lib/pages/validate.js" type="text/javascript"></script>
        <!-- ****** -->
        <script>
            
        </script>
    </head>
    <body>
        <div id ="contactForm" class="ui-state-default">
            <table align="center" width ="100%">
                <tr>
                    <td align="right">
                        Name :
                    </td>
                    <td width ="500px">
                        <input type ="text" id ="txtName" style ="width:200px;" />
                        <span id="Name_Status_Icon_1"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        E-Mail :
                    </td>
                    <td>
                        <input type ="text" id ="txtEmail" style ="width:200px;" />
                        <span id="Email_Address_Status_Icon_1"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Subject :
                    </td>
                    <td>
                        <input type ="text" id ="txtSubject" style ="width:200px;" />
                        <span id="Subject_Status_Icon_1"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Message :
                    </td>
                    <td>
                        <textarea id ="txtMessage" style ="width:200px; height:80px" ></textarea>
                        <span id="Message_Status_Icon_1"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <%@include file="captcha.jsp" %>
                    </td>
                </tr>
                <tr>
                    <td colspan ="2" align="center">
                        <input value="Submit" type = "image" src ="images/btn_submit_dis.png" id ="btnSubmit_C" disabled ="true" />
                    </td>
                </tr>
            </table>
        </div>
        <div id ="contactWait" style ="display:none;" class="ui-state-default">
                Now Sending Data <br />
                <span id="loading"></span>
        </div>
        <div id ="contactSuccess" style ="display:none;" class="ui-state-default">
                Recieve Your Cantact<br />
                Thank you for use my web site<br />
        </div>
        <div id ="contactError" style ="display:none;" class="ui-state-default">
                Send Fail.<br />
                Try Again !.<br />
                <span id ="showerror"></span>
        </div>
    </body>
</html>
