<%-- 
    Document   : check_register_patient
    Created on : 4 ก.ย. 2552, 19:01:56
    Author     : Kittipat_Mac
    ตรวจสอบชื่อ Username ของ Patient ตอนสมัครว่ามีอยู่แล้วหรือไม่
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="user.*"
%>

<%
    String username = request.getParameter("username").toString();
    NewPatient newPatient = new NewPatient();
    boolean canUse = newPatient.checkUsername(username);
    out.print(canUse); //ถ้ามี username นี้อยู่แล้วจะได้ false
%>
