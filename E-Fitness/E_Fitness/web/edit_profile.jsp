<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
        <!-- jQuery -->
        <script src="lib/jquery/jquery.autotab.js" type="text/javascript"></script>
        <!-- ****** -->
        <!-- Validate -->
        <script src="lib/pages/validate_edit.js" type="text/javascript"></script>
        <!-- ****** -->
    </head>
    <body>
     <%
        String username = session.getAttribute("username").toString();
        ArrayList param = new ArrayList();
        param.add(username);
        ResultSet result = myBean.selectData("SELECT * FROM user WHERE username=?",param);
        result.first();
     %>

<table id ="mainForm" align ="center" width="100%"  border="0" cellpadding="0" cellspacing="0">
<tr>
    <td>
    <div id ="editForm" class="ui-state-default">
        <table align="center" >
        <tr>
            <td align="right">
                Username :
            </td>
            <td>
                <input value = "<%=result.getString("username")%>" disabled ="true" type ="text" name ="txtUsername" id ="txtUsername" />
                <span id="Username_Status_Icon_1" class="success" ></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                Old Password :
            </td>
            <td>
                <input type ="password" name ="txtOldPassword" id ="txtOPassword" />
                <span id="OPassword_Status_Icon_1"></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                New Password :
            </td>
            <td>
                <input type ="password" name ="txtPassword" id ="txtPassword" />
                <span id="Password_Status_Icon_1"></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                Confirm New Password :
            </td>
            <td>
                <input type ="password" name ="txtCPassword" id ="txtCPassword" />
                <span id="CPassword_Status_Icon_1"></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                Email :
            </td>
            <td>
                <input value = "<%=result.getString("email")%>" type="text" name="txtEmail" id="txtEmail" />
                <span id="Email_Address_Status_Icon_1" class="success"></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                My Name :
            </td>
            <td>
                <input value = "<%=result.getString("name")%>" type ="text" name ="txtName" id ="txtName" />
                <input value = "<%=result.getString("surname")%>" type ="text" name ="txtSurname" id ="txtSurname" />
                <span id="Name_Status_Icon_1" class="success"></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                 Gender :
            </td>
            <td>
                <select name="ddGender" id ="ddGender" >
                <%
                    if(result.getString("gender").equals("Male")){
                        out.print("<option value =\"Male\" selected = \"selected\" >Male</option>");
                        out.print("<option value =\"Female\" >Female</option>");
                    }else{
                        out.print("<option value =\"Male\" >Male</option>");
                        out.print("<option value =\"Female\" selected = \"selected\" >Female</option>");
                    }
                %>
                </select>
                <span id="Gender_Status_Icon_1" class="success"></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                 Birthday :
            </td>
            <td>
                <input  type="text" value = "<%=result.getString("birthday")%>" id="datepicker">
                <span id="Birthday_Status_Icon_1" class="success"></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                Address :
            </td>
            <td>
                <input value = "<%=result.getString("address")%>" type="text" id="txtAddress" name ="txtAddress" />
                <span id="Address_Status_Icon_1" class="success"></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                Phone Number :
            </td>
            <td>
                    <%
                        String phone1 = "";
                        String phone2 = "";
                        String phone3 = "";
                        String phone = result.getString("phone");

                        if(phone.length() == 10){
                            phone1 = phone.substring(0, 3);
                            phone2 = phone.substring(3, 6);
                            phone3 = phone.substring(6, 10);
                        }else{
                            phone1 = phone.substring(0, 2);
                            phone2 = phone.substring(2, 5);
                            phone3 = phone.substring(5, 9);
                        }

                    %>
                    <input value ="<%=phone1%>" type="text" name="area_code" id="area_code" maxlength="3" size="1" /> -
                    <input value ="<%=phone2%>" type="text" name="number1" id="number1" maxlength="3" size="1" /> -
                    <input value ="<%=phone3%>"  type="text" name="number2" id="number2" maxlength="4" size="3" />
                    <span id="Phone_Status_Icon_1" class="success"></span>
            </td>
        </tr>
        <tr>
            <td align="right">
                Receive News from E-Fitness :
            </td>
            <td>
                <%
                if(result.getInt("receiveNews") == 1){
                    out.print("<input type=\"radio\" name=\"receive\" value=\"1\" checked = \"checked\" /> Recieve");
                    out.print("<input type=\"radio\" name=\"receive\" value=\"0\" />Don't Receive");
                }else{
                    out.print("<input type=\"radio\" name=\"receive\" value=\"1\" /> Recieve");
                    out.print("<input type=\"radio\" name=\"receive\" value=\"0\" checked = \"checked\" />Don't Receive");
                }

                %>
            </td>
        </tr>
        <tr>
            <td align ="center" colspan ="2">
                <input value="Submit" type = "image" src ="images/btn_submit.png" id ="btnSubmit" />
            </td>
        </tr>
    </table>
</div>
<div id ="editWait" align="center" style ="display:none;" class="ui-state-default">
        Now Sending Data <br />
        <span id="loading"></span>
</div>
<div id ="editSuccess" align="center" style ="display:none;" class="ui-state-default">
        Your Profile is Update.<br />
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
