<%-- 
    Document   : logins
    Created on : 4 ก.ย. 2552, 22:24:04
    Author     : Kittipat_Mac
    login เข้าสูระบบ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="web.*,
        database.*"
%>

<%
    String username = "";
    String password = "";
    try{
    username = request.getParameter("username").toString();
    password = request.getParameter("password").toString();
    }catch(Exception e){}
    UserLogin userLogin = new UserLogin();
    String[] userData = userLogin.login(username, password);
    //out.print(canLogin);
    if(userData[0].equals("true")){ //สามารถ login ได้
        if(userData[3].equals("patient")){ //patient
%>
<jsp:include page="../component/patient-control.jsp">
    <jsp:param name="username"  value="<%= userData[1] %>" />
    <jsp:param name="image"  value="<%= userData[2] %>" />
</jsp:include>
<%
        }else{ //admin
%>
<jsp:include page="../component/admin-control.jsp">
    <jsp:param name="username"  value="<%= userData[1] %>" />
    <jsp:param name="image"  value="<%= userData[2] %>" />
</jsp:include>
<%
        }//เมื่อ login ได้แล้วจึงค่อยสร้าง session
        session.setAttribute("username", username);
    }
%>












