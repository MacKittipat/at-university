<%-- 
    Document   : mske_appointment
    Created on : 17 ก.ย. 2552, 17:09:51
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
        database.*,
        appointment.*"
        %>
<%@include file="../component/encoding.jsp" %>

<%
    request.setCharacterEncoding("utf-8");
    String patientUsername = session.getAttribute("username").toString();
    String doctorId = request.getParameter("doctorId");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String detail = request.getParameter("detail");
    
    //หา patientId จาก username
    String patientId = "";
    CreateConnection con = new CreateConnection();
    String sql = "SELECT patient.patientId FROM patient,user WHERE user.username=? AND patient.userId=user.userId";
    PreparedStatement pre = con.getConnection().prepareStatement(sql);
    pre.setString(1, patientUsername);
    ResultSet result = pre.executeQuery();
    if(result.first()){
        patientId = result.getString("patient.patientId");
    }
    
    Appointment appointment = new Appointment();
    boolean ret = appointment.makeAppointment(patientId, doctorId, date, time, detail);
    
    //หา appointmentId ที่เพิ่ง make appointment ไปล่าสุด
    String appointmentId = "";
    String sql2 = "SELECT appointmentId FROM appointment WHERE patientId=? AND doctorId=? ORDER BY appointmentId DESC";
    PreparedStatement pre2 = con.getConnection().prepareStatement(sql2);
    pre2.setString(1, patientId);
    pre2.setString(2, doctorId);
    ResultSet result2 = pre2.executeQuery();
    if(result2.first()){
        appointmentId = result2.getString("appointmentId");
    }

    if(ret == true){
        out.print("Appointment Complete <br /><br /> <a target='_blank' href='report_appointment.jsp?aid=" + appointmentId + "'>Print Appointment</a>");
    }else{
        out.print("false");
    }
%>