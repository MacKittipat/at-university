<%-- 
    Document   : register-doctor
    Created on : 12 ก.ย. 2552, 14:49:16
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
        database.*"
        %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

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
        <!---Script Login--->
        <script type="text/javascript" src="script/component/login.js"></script>
        <!--[Script Login]-->
        <!--[AjaxUpload]-->
        <script type="text/javascript" src="script/lib/ajaxupload/ajaxupload.js"></script>
        <!---AjaxUpload--->
        <!---Script--->
        <script type="text/javascript" src="script/register-doctor.js"></script>
        <!--[Script]-->
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
                    Register Doctor
                </h2>
                <div class="p-content">
                    <form class="form-regis-doctor" action="#" method="post" enctype="multipart/form-data">
                        <table>
                            <tr>
                                <td>
                                    Name
                                </td>
                                <td>
                                    : <input type="text" id="txtName" name="txtName">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Lastname
                                </td>
                                <td>
                                    : <input type="text" id="txtLastname" name="txtLastname">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Gender
                                </td>
                                <td>
                                    :
                                    <select id="ddlGender">
                                        <option value="Male">
                                            Male
                                        </option>
                                        <option value="Female">
                                            Female
                                        </option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Telephone Number
                                </td>
                                <td>
                                    : <input type="text" id="txtTelNumber" name="txtTelNumber" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Email
                                </td>
                                <td>
                                    : <input type="text" id="txtEmail" name="txtEmail">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Department
                                </td>
                                <td>
                                    :
                                    <select id="ddlDepartment">
                                        <%
                                            CreateConnection con = new CreateConnection();
                                            String sql = "SELECT departmentId,departmentName FROM department";
                                            PreparedStatement pre = con.getConnection().prepareStatement(sql);
                                            ResultSet result = pre.executeQuery();
                                            while(result.next()){
                                                out.print("<option value='" + result.getString("departmentId") + "'>" + result.getString("departmentName") + "</option>");
                                            }
                                        %>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Work Time
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                : <input type="checkbox" id="chkTime1" value="8.00-9.00" /> 8.00-9.00
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;&nbsp;<input type="checkbox" id="chkTime2" value="9.00-10.00" /> 9.00-10.00
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;&nbsp;<input type="checkbox" id="chkTime3" value="10.00-11.00" /> 10.00-11.00
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;&nbsp;<input type="checkbox" id="chkTime4" value="11.00-12.00" /> 11.00-12.00
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;&nbsp;<input type="checkbox" id="chkTime5" value="12.00-13.00" /> 12.00-13.00
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;&nbsp;<input type="checkbox" id="chkTime6" value="13.00-14.00" /> 13.00-14.00
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;&nbsp;<input type="checkbox" id="chkTime7" value="14.00-15.00" /> 14.00-15.00
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;&nbsp;<input type="checkbox" id="chkTime8" value="15.00-16.00" /> 15.00-16.00
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;&nbsp;<input type="checkbox" id="chkTime9" value="16.00-17.00" /> 16.00-17.00
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;&nbsp;<input type="checkbox" id="chkTime10" value="17.00-18.00" /> 17.00-18.00
                                            </td>
                                        </tr>
                                    </table>                                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Image
                                </td>
                                <td>
                                    : <span id="uploadimage"><a href="#">Upload</a></span><span style="display:block;" id="uploadmsg"></span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="submit" id="btnRegister" value="Register" />
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