<%-- 
    Document   : edit_appointment
    Created on : 18 ก.ย. 2552, 12:53:58
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
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
        <!---Script--->
        <script type="text/javascript" src="script/view-appointment.js"></script>
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
                    View Appointment
                </h2>
                <div class="p-content">
                    <%
                        String patientUsername  = session.getAttribute("username").toString();
                        //หา patientId จาก username
                        String patientIds = "";
                        CreateConnection con = new CreateConnection();
                        String sql3 = "SELECT patient.patientId FROM patient,user WHERE user.username=? AND patient.userId=user.userId";
                        PreparedStatement pre3 = con.getConnection().prepareStatement(sql3);
                        pre3.setString(1, patientUsername);
                        ResultSet result3 = pre3.executeQuery();
                        if(result3.first()){
                            patientIds = result3.getString("patient.patientId");
                        }
                    
                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        Date dateNow = new Date(); //วันปัจจุบัน
                        Date dateAppointment = null; //วันที่นัดจากใน db                    
                        //แสดง appointment ทุกอันเฉพาะอันที่มีวันที่มากกว่าวันปัจจุบัน
                        String sql = "SELECT appointmentId,patientId,doctorId,date,time FROM appointment WHERE patientId=? ORDER BY date ASC";
                        PreparedStatement pre = con.getConnection().prepareStatement(sql);
                        pre.setString(1, patientIds);
                        ResultSet result = pre.executeQuery();
                        out.print("<ul style='list-style:none;'>");
                        /*
                            delete : query/delete_appointment.jsp
                        */
                        while(result.next()){
                            dateAppointment = result.getDate("date");
                            String appointmentId = result.getString("appointmentId");
                            String patientId = result.getString("patientId");
                            String doctorId = result.getString("doctorId");
                            String date = result.getString("date");
                            String time = result.getString("time");
                            //dateFormat.format(dateAppointment).compareTo(dateFormat.format(dateNow)) == 0 ใช่เช็คว่าวันที่ appointment เป็นวันปัจจุบันหรือไม่ (0 = ใช่)
                            if(dateAppointment.after(dateNow) || dateFormat.format(dateAppointment).compareTo(dateFormat.format(dateNow)) == 0){ //เลือกเฉพาะวันปัจจุบัเป็นต้นไปคือวัน appointment ที่ผ่านมาแล้วจะไม่ต้องแสดง
                                out.print("<li id='list-" + appointmentId + "' style='margin-bottom:5px;'>" +
                                        "<div>" + date + " " + time + "</div>" +
                                        "<div><span style='margin-right:15px;'><a id='btnView' href='view_appointment_detail.jsp?aid=" + appointmentId + "'>View</a></span>" +
                                        "<span style='margin-right:15px;'><a id='btnEdit' href='edit_appointment.jsp?aid=" + appointmentId + "'>Edit</a></span>" +
                                        "<span style='margin-right:15px;'><a id='btnDelete' onclick='deleteAppointment(" + appointmentId + ")' href='#'>Delete</a></span>" +
                                        "<span style='margin-right:15px;'><a id='btnPrint' target='_blank' href='report_appointment.jsp?aid=" + appointmentId + "'>Print</a></span></div>" +
                                        "</li>");
                            }       
                        }
                        out.print("</ul>");
                        if(!result.first()){//ถ้าไม่มีการ appointment จะแสดงข้อความเตือน
                            out.print("<div style='color:red;'>You are not appointment.</div>");
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
