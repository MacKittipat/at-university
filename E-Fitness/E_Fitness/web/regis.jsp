<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Form</title>
        <!-- jQuery -->
        <script src="lib/jquery/jquery.autotab.js" type="text/javascript"></script>
        <!-- ****** -->
        <!-- Validate -->
        <script src="lib/pages/validate.js" type="text/javascript"></script>
        <!-- ****** -->        
    </head>
    <body>
     <table id ="mainForm" align ="center"  border="0" cellpadding="0" cellspacing="0" width="100%">
         <tr>
            <td>
            <div id ="regisForm" class="ui-state-default">
            <table align ="center">
                <tr>
                    <td align="right">
                        Username :
                    </td>
                    <td>
                        <input type ="text" name ="txtUsername" id ="txtUsername" /> <span id="Username_Status_Icon_1"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Password :
                    </td>
                    <td>
                        <input type ="password" name ="txtPassword" id ="txtPassword" /><span id="Password_Status_Icon_1"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Confirm Password :
                    </td>
                    <td>
                        <input type ="password" name ="txtCPassword" id ="txtCPassword" /><span id="CPassword_Status_Icon_1"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Email :
                    </td>
                    <td>
                        <input type="text" name="txtEmail" id="txtEmail" /><span id="Email_Address_Status_Icon_1"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        My Name :
                    </td>
                    <td>
                        <input type ="text" name ="txtName" id ="txtName" /> <input class="textbox" type ="text" name ="txtSurname" id ="txtSurname" />
                        <span id="Name_Status_Icon_1"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                         Gender :
                    </td>
                    <td>
                        <select name="ddGender" id ="ddGender" >
                            <option value ="null">- Select One -</option>
                            <option value ="Male" >Male</option>
                            <option value ="Female" >Female</option>
                        </select> <span id="Gender_Status_Icon_1"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                         Birthday :
                    </td>
                    <td>
                        <input  type="text" value = "yyyy-mm-dd" id="datepicker"> <span id="Birthday_Status_Icon_1"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Address :
                    </td>
                    <td>
                        <input type="text" id="txtAddress" name ="txtAddress" /> <span id="Address_Status_Icon_1"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Phone Number :
                    </td>
                    <td>
                            <input type="text" name="area_code" id="area_code" maxlength="3" size="1" /> -
                            <input type="text" name="number1" id="number1" maxlength="3" size="1" /> -
                            <input type="text" name="number2" id="number2" maxlength="4" size="3" />
                            <span id="Phone_Status_Icon_1"></span>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        Receive News from E-Fitness :
                    </td>
                    <td>
                        <input type="radio" name="receive" value="1" checked = "checked" /> Recieve
                        <input type="radio" name="receive" value="0" />Don't Receive
                    </td>
                </tr>
                <tr>
                    <td align ="center" colspan="2">
                        <%@include file="captcha.jsp" %>
                    </td>
                </tr>
                <tr>
                    <td align ="center" colspan ="2">
                        <input value="Submit" type = "image" src ="images/btn_submit_dis.png" id ="btnSubmit" disabled ="true" />                
                    </td>
                </tr>
            </table>
        </div>
        <div id ="regisWait" align="center" style ="display:none;" class="ui-state-default">
                Now Sending Data <br />
                <span id="loading"></span>
        </div>
        <div id ="regisSuccess" align="center" style ="display:none;" class="ui-state-default">
                Thank you for Registration.<br />
                Please Activate Your Username in your Email.<br />
        </div>
        <div id ="regisError" align="center" style ="display:none;" class="ui-state-default">
                Registration Fail.<br />
                Try Again !.
        </div>
            </td>
         </tr>
     </table>
</body>
</html>
