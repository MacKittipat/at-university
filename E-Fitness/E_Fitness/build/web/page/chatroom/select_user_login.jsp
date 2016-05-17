<%-- 
    Document   : select_user_login
    Created on : 21 มิ.ย. 2552, 10:07:09
    Author     : Kittipat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<%
     request.setCharacterEncoding("utf-8");
     ResultSet result = myBean.selectData("SELECT * FROM user JOIN login WHERE login.user_id = user.id");
     String user = "";
     while(result.next())
     {
        user += result.getString("username") + "<br/>";
     }
     out.print(user);
%>