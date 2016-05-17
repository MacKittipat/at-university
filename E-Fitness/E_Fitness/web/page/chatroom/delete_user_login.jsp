<%-- 
    Document   : delete_user_login
    Created on : 21 มิ.ย. 2552, 13:30:31
    Author     : Kittipat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<%
     request.setCharacterEncoding("utf-8");
     ArrayList param = new ArrayList();
     param.add(request.getParameter("userid"));
     int result = myBean.queryData("DELETE FROM login WHERE user_id=?",param);
%>