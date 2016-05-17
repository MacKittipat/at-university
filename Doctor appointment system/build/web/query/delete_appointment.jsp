<%-- 
    Document   : delete_appointment
    Created on : 18 ก.ย. 2552, 13:46:57
    Author     : Kittipat_Mac
    delete appointment
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="appointment.*"
        %>

<%
    String appointmentId = request.getParameter("appointmentId");
    Appointment appointment = new Appointment();
    appointment.deleteAppointment(appointmentId);
%>
