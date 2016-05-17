<%-- 
    Document   : admin_view_appointment
    Created on : 18 ก.ย. 2552, 18:09:10
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
                        CreateConnection con = new CreateConnection();
                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        Date dateNow = new Date(); //วันปัจจุบัน
                        Date dateAppointment = null; //วันที่นัดจากใน db
                        //แสดง appointment ทุกอันเฉพาะอันที่มีวันที่มากกว่าวันปัจจุบัน
                        String sql = "SELECT appointmentId,patientId,doctorId,date,time FROM appointment ORDER BY date ASC";
                        PreparedStatement pre = con.getConnection().prepareStatement(sql);
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
                            if(dateAppointment.after(dateNow) || dateFormat.format(dateAppointment).compareTo(dateFormat.format(dateNow)) == 0){ //เลือกเฉพาะวันหลังจากววันปันจุบัน คือวันที่เป็นวันเดียวกับวันปันจุบันจะแก้ไขไม่ได้
                                out.print("<li id='list-" + appointmentId + "' style='margin-bottom:5px;'>" +
                                        "<div>" + date + " " + time + "</div>" +
                                        "<div><span style='margin-right:15px;'><a id='btnEdit' href='view_appointment_detail.jsp?aid=" + appointmentId + "'>View</a></span></div>" +
                                        "</li>");
                            }
                        }
                        out.print("</ul>");


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

