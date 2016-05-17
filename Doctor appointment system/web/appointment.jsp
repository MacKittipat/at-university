<%-- 
    Document   : appointment
    Created on : 5 ก.ย. 2552, 17:32:05
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
        database.*"
        %>
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
        <!---jQuery-UI--->
        <link rel="stylesheet" href="script/lib/jquery-ui/jquery-ui.css" />
        <script type="text/javascript" src="script/lib/jquery-ui/jquery-ui.js"></script>
        <!--[jQuery-UI]-->        
        <!---jQuery-LiveQuery--->
        <script type="text/javascript" src="script/lib/jquery/jquery-livequery.js"></script>
        <!--[jQuery-LiveQuery]-->
        <!---Script Login--->
        <script type="text/javascript" src="script/component/login.js"></script>
        <!--[Script Login]-->
        <!---Script--->
        <script type="text/javascript" src="script/appointment.js"></script>
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
                    Appointment
                </h2>
                <div class="p-content">
                    <div id="form-appointment">
                        <form id="form-appointment" action="" method="post">
                            <div id="select-department">
                                <select id="ddlDepartment" style="width:335px;">
                                    <option value="0">
                                        &lt;&lt;&lt; Choose Department &gt;&gt;&gt;
                                    </option>
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
                            </div>
                                <br />
                            <div id="select-doctor">
                                <select id="ddlDoctor" style="width:335px;">
                                    <option value="0">
                                        &lt;&lt;&lt; Choose Doctor &gt;&gt;&gt;
                                    </option>
                                    <%
                                        String sql2 = "SELECT doctorId,name,lastname FROM doctor";
                                        PreparedStatement pre2 = con.getConnection().prepareStatement(sql2);
                                        ResultSet result2 = pre2.executeQuery();
                                        while(result2.next()){
                                            out.print("<option value='" + result2.getString("doctorId") + "'>" + result2.getString("name") + " " + result2.getString("lastname") + "</option>");
                                        }
                                    %>
                                </select>
                                <span id="msg-select-doctor" style="color:red;display:block"></span>
                            </div>
                            <br />
                            <table>
                                <tr>
                                    <td>
                                        Choose Date
                                    </td>
                                    <td>
                                        : <input type="text" id="txtDate" name="txtDate" /> <span id="msg-date" style="color:red;display:block"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Choose Time
                                    </td>
                                    <td>
                                        :
                                        <span id="select-time">
                                            <select id="ddlTime" style="width:255px;">
                                                <option value="0">
                                                    &lt;&lt;&lt; Choose Time &gt;&gt;&gt;
                                                </option>
                                                <!--
                                                <option value="8.00-9.00">
                                                    8.00-9.00
                                                </option>
                                                <option value="9.00-10.00">
                                                    9.00-10.00
                                                </option>
                                                <option value="10.00-11.00">
                                                    10.00-11.00
                                                </option>
                                                <option value="11.00-12.00">
                                                    11.00-12.00
                                                </option>
                                                <option value="12.00-13.00">
                                                    12.00-13.00
                                                </option>
                                                <option value="13.00-14.00">
                                                    13.00-14.00
                                                </option>
                                                <option value="14.00-15.00">
                                                    14.00-15.00
                                                </option>
                                                <option value="15.00-16.00">
                                                    15.00-16.00
                                                </option>
                                                <option value="16.00-17.00">
                                                    16.00-17.00
                                                </option>
                                                <option value="17.00-18.00">
                                                    17.00-18.00
                                                </option>
                                                -->
                                            </select>
                                        </span>
                                        <span id="msg-select-time" style="color:red;display:block"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Detail
                                    </td>
                                    <td>
                                        : <textarea id="txtDetail" style="width:250px;height:100px;"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <div style="padding-left:200px;">
                                <input type="button" id="btnAppointment" value="Make Appointment" />
                            </div>
                        </form>
                    </div>
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