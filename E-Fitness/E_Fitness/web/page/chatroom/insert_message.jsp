<%-- 
    Document   : insert_message
    Created on : Jun 19, 2009, 3:06:49 PM
    Author     : B@nk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<%
    request.setCharacterEncoding("utf-8");
    String userId = request.getParameter("userid");
    String message = request.getParameter("message");
    String datetime = request.getParameter("datetime");
    ArrayList param = new ArrayList();
    param.add(userId);
    param.add(message);
    param.add(datetime);
    int result = myBean.queryData("INSERT INTO chatroom(user_id,message,datetime) VALUES(?,?,?)", param);
    
%>