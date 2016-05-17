<%-- 
    Document   : admin_view_appointment_detail
    Created on : 19 ก.ย. 2552, 11:56:16
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
        database.*,
        java.text.*,
        java.util.Date,
        user.*,
        appointment.*"
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
        <!---jQuery-LiveQuery--->
        <script type="text/javascript" src="script/lib/jquery/jquery-livequery.js"></script>
        <!--[jQuery-LiveQuery]-->
        <!---Script Login--->
        <script type="text/javascript" src="script/component/login.js"></script>
        <!--[Script Login]-->
        <!---Script--->
        <script type="text/javascript" src="script/view-appointment-detail.js"></script>
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
                    View Appointment Detail
                </h2>
                <div class="p-content">
                    <%
                        String appointmentId = request.getParameter("aid");
                        Appointment appointment = new Appointment(appointmentId);
                        String patientId = appointment.getPatientId();
                        String doctorId = appointment.getDoctorId();
                        String date = appointment.getDate();
                        String time = appointment.getTime();
                        String detail = appointment.getDetail();
                        out.print("<div style='font-size:medium;font-weight:bolder;'>" + date + " " + time + "</div><br />");
                        //Patient Detail
                        OldPatient oldPatient = new OldPatient(patientId);
                        out.print("<div style='font-size:medium;font-weight:bolder;'>Patient</div>");
                        out.print("<div><img src='upload/patient/" + oldPatient.getImage() + "' alt='" + oldPatient.getImage() + "' /></div>");
                        out.print("<div>" + oldPatient.getName() + " " + oldPatient.getLastname() + " <span style='color:#ff8040;font-weight:bolder;cursor:pointer;' id='btnPatientMore'>More</span></div> ");
                        out.print("<div id='patient-more' style='display:none;'>" +
                                "<table>" +
                                "<tr>" +
                                "<td style='width:120px;'>Birthdate</td><td style='width:200px;'> : " + oldPatient.getBirthdate() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                "<td>Gender</td><td> : " + oldPatient.getGender() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                "<td>Weight / Height</td><td> : " + oldPatient.getWeight() + " (kg.) / " + oldPatient.getHeight() + " (cm.)</td>" +
                                "</tr>" +
                                "<tr>" +
                                "<td>Blood Group</td><td> : " + oldPatient.getBloodGroup() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                "<td>Address</td><td> : " + oldPatient.getBirthdate() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                "<td>Telephone Number</td><td> : " + oldPatient.getTelNumber() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                "<td>Email</td><td> : " + oldPatient.getEmail() + "</td>" +
                                "</tr>" +
                                "</table>" +
                                "</div>");
                        //Doctor Detail
                        Doctor doctor = new Doctor(doctorId);
                        out.print("<div style='font-size:medium;font-weight:bolder;'>Doctor</div>");
                        out.print("<div><img src='upload/doctor/" + doctor.getImage() + "' alt='" + doctor.getImage() + "' /></div>");
                        out.print("<div>" + doctor.getName() + " " + doctor.getLastname() + " <span style='color:#ff8040;font-weight:bolder;cursor:pointer;' id='btnDoctorMore'>More</span></div>");
                        out.print("<div id='doctor-more' style='display:none;'>" +
                                "<table>" +
                                "<tr>" +
                                "<td style='width:120px;'>Gender</td><td style='width:200px;'> : " + doctor.getGender() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                "<td>Department</td><td> : " + doctor.getDepartmentName() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                "<td>Telephone Number</td><td> : " + doctor.getTelNumber() + "</td>" +
                                "</tr>" +
                                "<tr>" +
                                "<td>Email</td><td> : " + doctor.getEmail() + "</td>" +
                                "</tr>" +
                                "</table>" +
                                "</div>");
                        //Appointment Detail
                        out.print("<div style='font-size:medium;font-weight:bolder;'>Appointment Detail</div>");
                        out.print("<div>" + appointment.getDetail() + "</div>");
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
