<%-- 
    Document   : logout
    Created on : 25 มิ.ย. 2552, 15:10:42
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // clear session
    session.setAttribute("username", "");
    session.setAttribute("userId", "");
%>