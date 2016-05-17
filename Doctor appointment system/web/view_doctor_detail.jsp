<%-- 
    Document   : view_doctor_detail
    Created on : 19 ก.ย. 2552, 11:05:52
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
                database.*,
                java.text.*,
                java.util.Date"
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
                    View Doctor Detail
                </h2>
                <div class="p-content">
                    <%
                        String doctorId = request.getParameter("did");
                        CreateConnection con = new CreateConnection();
                        String username = "";
                        //select type ของคนที่ login ถ้าเป็น admin จะดู detail ของ appointment ได้
                        try{
                            username = session.getAttribute("username").toString();
                        }catch(Exception e){}
                        
                        String type = "";
                        String sql4 = "SELECT type FROM user WHERE username=?";
                        PreparedStatement pre4 = con.getConnection().prepareStatement(sql4);
                        pre4.setString(1, username);
                        ResultSet result4 = pre4.executeQuery();
                        if(result4.first()){
                            type = result4.getString("type");
                        }
                        //แสดงรูปขนาดเต็มและชื่อ
                        String sql = "SELECT name,lastname,image FROM doctor WHERE doctorId=?";
                        PreparedStatement pre = con.getConnection().prepareStatement(sql);
                        pre.setString(1, doctorId);
                        ResultSet result = pre.executeQuery();
                        if(result.first()){
                            out.print("<div><img src='upload/doctor/" + result.getString("image") + "' alt='" + result.getString("image") + "' /></div><div style='font-weight:bolder;font-size:medium;'>" + result.getString("name") + " " + result.getString("lastname") + "</div>");
                        }                 
                        //หา time ของ doctor
                        String sql2 = "SELECT time FROM worktime WHERE doctorId=?";
                        PreparedStatement pre2 = con.getConnection().prepareStatement(sql2);
                        pre2.setString(1, doctorId);
                        ResultSet result2 = pre2.executeQuery();
                        String time = "<table>";
                        time += "<tr><td style='font-weight:bolder'>Work Time</td></tr>";
                        while(result2.next()){
                            time += "<tr><td>" + result2.getString("time") + "</td></tr>";
                        }
                        time += "</table>";
                        out.print(time);


                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        Date dateNow = new Date(); //วันปัจจุบัน
                        Date dateAppointment = null; //วันที่นัดจากใน db

                        //หา appointment
                        String sql3 = "SELECT appointmentId,date,time FROM appointment WHERE doctorId=?";
                        PreparedStatement pre3 = con.getConnection().prepareStatement(sql3);
                        pre3.setString(1, doctorId);
                        ResultSet result3 = pre3.executeQuery();
                        String appointment = "<table>";
                            appointment += "<tr>";
                            appointment += "<td style='font-weight:bolder'>Appointment</td>";
                            appointment += "</tr>";
                        while(result3.next()){
                            String appointmentId = result3.getString("appointmentId");
                            dateAppointment = result3.getDate("date");
                            if(dateAppointment.after(dateNow) || dateFormat.format(dateAppointment).compareTo(dateFormat.format(dateNow)) == 0){ //เลือกเฉพาะวันปัจจุบัเป็นต้นไปคือวัน appointment ที่ผ่านมาแล้วจะไม่ต้องแสดง
                                if(type.equals("admin")){//เป็น admin จะดูรายละเอียดการ appointment ได้
                                    appointment += "<tr>";
                                    appointment += "<td><a href='view_appointment_detail.jsp?aid=" + appointmentId + "'>" + result3.getString("date") + " " + result3.getString("time") + "</a></td>";
                                    appointment += "</tr>";
                                }else{//ไม่ใช่ admin
                                    appointment += "<tr>";
                                    appointment += "<td>" + result3.getString("date") + " " + result3.getString("time") + "</td>";
                                    appointment += "</tr>";
                                }
                            }
                        }
                        appointment += "</table>";
                        if(result3.first()){
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

