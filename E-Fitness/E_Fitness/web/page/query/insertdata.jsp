<%-- 
    Document   : insertdata
    Created on : Jun 12, 2009, 2:13:10 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"  %>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<%
    String userId = session.getAttribute("userId").toString();
    String id = new String(request.getParameter("id").getBytes("utf-8"), "utf-8");
    String startDate = new String(request.getParameter("start_date").getBytes("utf-8"), "utf-8");
    String endDate = new String(request.getParameter("end_date").getBytes("utf-8"), "utf-8");
    String text = new String(request.getParameter("text").getBytes("utf-8"), "utf-8");
    String details = new String(request.getParameter("details").getBytes("utf-8"), "utf-8");
    String calories = new String(request.getParameter("calories").getBytes("utf-8"), "utf-8");
    ArrayList param = new ArrayList();
    param.add(startDate);
    param.add(endDate);
    param.add(text);
    param.add(details);
    param.add(calories);
    param.add(id);
    param.add(userId);
    int result = myBean.queryData("INSERT INTO calendar(start_date,end_date,text,details,calories,auto_id,user_id) VALUES(?,?,?,?,?,?,?)",param);
%>