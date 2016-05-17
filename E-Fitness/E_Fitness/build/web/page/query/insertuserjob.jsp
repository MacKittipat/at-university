<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"  %>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<%
    request.getParameter("utf-8");
    String userId = new String(request.getParameter("userid").getBytes("utf-8"), "utf-8");
    String jobs = request.getParameter("jobs");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    int result;
    ArrayList param = new ArrayList();
    param.add(date + " " + time);
    param.add(date + " " + time);
    param.add(jobs);
    param.add("your details");
    param.add(userId);
    result = myBean.queryData("INSERT INTO calendar(start_date,end_date,text,details,user_id) VALUES(?,?,?,?,?)",param);
%>