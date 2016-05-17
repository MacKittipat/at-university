<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"  %>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<%
    String login = "false";
    request.getParameter("utf-8");
    String username = new String(request.getParameter("username").getBytes("utf-8"), "utf-8");
    String password = new String(request.getParameter("password").getBytes("utf-8"), "utf-8");
    ArrayList param = new ArrayList();
    param.add(username);
    param.add(password);
    ResultSet result = myBean.selectData("SELECT * FROM user WHERE username=? AND password=?",param);
    if(result.first())
    {
        login = "true";
        //create session for user
        session.setAttribute("username", username);
        session.setAttribute("userId", result.getString("id"));
    }
    out.print(login);
%>