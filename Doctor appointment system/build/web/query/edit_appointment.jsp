<%-- 
    Document   : edit_appointment
    Created on : 19 ก.ย. 2552, 17:01:03
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
        database.*,
        appointment.*"
        %>
<%@include file="../component/encoding.jsp" %>

<%
    String patientUsername = session.getAttribute("username").toString();
    String appointmentId = request.getParameter("appointmentId");
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
    boolean ret = appointment.editAppointment(appointmentId, patientId, doctorId, date, time, detail);
    if(ret == true){
        out.print("Edit Appointment Complete <br /><br /> <a target='_blank' href='report_appointment.jsp?aid=" + appointmentId + "'>Print Appointment</a>");
    }else{
        out.print("false");
    }
%>
