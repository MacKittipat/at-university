<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"  %>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<%
    String user = "";
    String username = session.getAttribute("username").toString();
    ArrayList param = new ArrayList();
    param.add(username);
    ResultSet result = myBean.selectData("SELECT username FROM user WHERE username=?",param);
    if(result.first())
    {
        user = result.getString("username");
    }
    out.print(user);
%>