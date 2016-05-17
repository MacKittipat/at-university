<%-- 
    Document   : register_doctor
    Created on : 13 ก.ย. 2552, 18:44:05
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="user.*,
        java.io.*,
        java.util.*"
%>
<%@include file="../component/encoding.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    String name = request.getParameter("name");
    String lastname = request.getParameter("lastname");
    String gender = request.getParameter("gender");
    String telNumber = request.getParameter("telNumber");
    String email = request.getParameter("email");
    String departmentId = request.getParameter("departmentId");
    String image = request.getParameter("image").trim();
    if(image.equals("Error only images are allowed") || image.equals("Error please upload image with size less than 300kb")){ //ถ้า String image ไม่ใช่ชื่อรูปจะให้ image=""
        image = ""; //เมื่อ upload image ไม่ผ่านจะถือว่าไม่ได้ upload รูป
    }
    String[] workTime = request.getParameterValues("time");
    Doctor doctor = new Doctor(name, lastname, gender, departmentId, workTime, telNumber, email, image);
    doctor.registerDoctor();
%>
