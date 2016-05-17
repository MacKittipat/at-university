<%--
    Document   : regis
    Created on : 28 ส.ค. 2552, 17:41:31
    Author     : Kittipat_Mac
    Add patient ลง DB
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="user.*,
        java.io.*,
        java.util.*,
        org.apache.commons.fileupload.*,
        org.apache.commons.fileupload.disk.*,
        org.apache.commons.fileupload.servlet.*,
        org.apache.commons.io.*"
%>
<%@include file="../component/encoding.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    String idNumber = request.getParameter("idNumber");
    String name = request.getParameter("name");
    String lastname = request.getParameter("lastname");
    String birthdate = request.getParameter("birthdate");
    String gender = request.getParameter("gender");
    float weight = Float.parseFloat(request.getParameter("weight").toString());
    float heigth = Float.parseFloat(request.getParameter("height").toString());
    String bloodGroup = request.getParameter("bloodGroup");
    String address = request.getParameter("address");
    String telNumber = request.getParameter("telNumber");
    String email = request.getParameter("email");
    String image = request.getParameter("image").trim();
    if(image.equals("Error only images are allowed") || image.equals("Error please upload image with size less than 300kb")){ //ถ้า String image ไม่ใช่ชื่อรูปจะให้ image=""
        image = ""; //เมื่อ upload image ไม่ผ่านจะถือว่าไม่ได้ upload รูป
    }
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    NewPatient newPatient = new NewPatient(idNumber, name, lastname, birthdate, gender, heigth, weight, bloodGroup, address, telNumber, email, image, username, password);
    newPatient.register();
%>