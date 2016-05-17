<%-- 
    Document   : updatedata.jsp
    Created on : Jun 12, 2009, 12:28:11 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"  %>

<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<%
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
    param.add(id); // auto_id เอาไว้แก้ undefine ใน details (ตอนสร้าง event ใหม่ dhtmlx จะสร้าง auto_id ให้ แล้วเมื่อจะ update detail หลังจากที่สร้าง event ใหม่จะได้ undefine เพราะ เมื่อ update แล้วจะไม่เจอ id จึงต้องหา auto_id แทนในการ update)
    int result = myBean.queryData("UPDATE calendar SET start_date=?,end_date=?,text=?,details=?,calories=? WHERE id=? OR auto_id=?",param);
%>
