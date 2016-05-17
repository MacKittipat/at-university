<%-- 
    Document   : edit_appointment
    Created on : 18 ก.ย. 2552, 15:07:24
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
        database.*,
        appointment.*"
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
        <script type="text/javascript" src="script/edit-appointment.js"></script>
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
                    Edit Appointment
                </h2>
                <div class="p-content">
                    <%
                        String appointmentId = request.getParameter("aid");
                        Appointment appointment = new Appointment(appointmentId);
                        String date = appointment.getDate();
                        String detail = appointment.getDetail();
                    %>
                    <div id="form-appointment">
                        <form id="form-appointment" action="" method="post">
                            <input type="hidden" name="hidAid" id="hidAid" value="<%= appointmentId %>">
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
                                        : <input type="text" id="txtDate" name="txtDate" value="<%= date %>" /> <span id="msg-date" style="color:red;display:block"></span>
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
                                        : <textarea id="txtDetail" style="width:250px;height:100px;"><%= detail %></textarea>
                                    </td>
                                </tr>
                            </table>
                            <div style="padding-left:200px;">
                                <input type="button" id="btnEditAppointment" value="Edit Appointment" />
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