<%-- 
    Document   : admin_view_patient_detail
    Created on : 19 ก.ย. 2552, 15:14:55
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="user.*,
        appointment.*,
        java.sql.*,
        database.*,
        java.text.*,
        java.util.Date"
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
                    View Patient Detail
                </h2>
                <div class="p-content">
                    <%
                        String patientId = request.getParameter("pid");
                        OldPatient oldPatient = new OldPatient(patientId);
                        String name = oldPatient.getName();
                        String lastname = oldPatient.getLastname();
                        String image = oldPatient.getImage();     
                    %>
                    <div>
                        <img src="upload/patient/<%= image %>" alt="<%= image %>" />
                    </div>
                    <div style="font-size:medium;font-weight:bolder;">
                        <%= name %> <%= lastname %>
                    </div>
                    <%
                        CreateConnection con = new CreateConnection();
                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        Date dateNow = new Date(); //วันปัจจุบัน
                        Date dateAppointment = null; //วันที่นัดจากใน db
                        String sql = "SELECT appointmentId,date,time FROM appointment WHERE patientId=? ORDER BY date";
                        PreparedStatement pre = con.getConnection().prepareStatement(sql);
                        pre.setString(1, patientId);
                        ResultSet result = pre.executeQuery();
                        String appointment = "<table>";
                        appointment += "<tr>";
                        appointment += "<td style='font-weight:bolder'>Appointment</td>";
                        appointment += "</tr>";
                        while(result.next()){
                            String appointmentId = result.getString("appointmentId");
                            dateAppointment = result.getDate("date");
                            if(dateAppointment.after(dateNow) || dateFormat.format(dateAppointment).compareTo(dateFormat.format(dateNow)) == 0){ //เลือกเฉพาะวันหลังจากววันปันจุบัน คือวันที่เป็นวันเดียวกับวันปันจุบันจะไม่แสดง
                                appointment += "<tr>";
                                appointment += "<td><a href='view_appointment_detail.jsp?aid=" + appointmentId + "'>" + result.getString("date") + " " + result.getString("time") + "</a></td>";
                                appointment += "</tr>";
                            }
                        }
                        appointment += "</table>";
                        if(result.first()){
                            out.print(appointment);
                        }else{
                            out.print("<div style='color:red;'>Not have appointment.</div>");
                        }
                    %>
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
