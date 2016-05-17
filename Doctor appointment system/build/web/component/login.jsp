<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
        database.*,
        web.*"
%>

<%
    String username = "";
    try{
        username = session.getAttribute("username").toString();
    }catch(Exception e){}
    if(username.equals("")){ //ได้ค่าว่างคือไม่ได้ login
%>
<form action="#">
<table>
    <tr>
        <td>
            User
        </td>
        <td>
            : <input type="text" id="txtUsernameLogin" />
        </td>
    </tr>
    <tr>
        <td>
            Pass
        </td>
        <td>
            : <input type="password" id="txtPasswordLogin" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" id="btnLogin" value="Login" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            Register <a href="register.jsp">Here</a>
        </td>
    </tr>
</table>        
</form>

<%
    }else{ //login แล้ว
        UserLogin userLogin = new  UserLogin();
        String[] userData = userLogin.checklogin(username);
        if(userData[0].equals("true")){ //สามารถ login ได้
            if(userData[3].equals("patient")){ //patient
%>
<jsp:include page="patient-control.jsp">
    <jsp:param name="username"  value="<%= userData[1] %>" />
    <jsp:param name="image"  value="<%= userData[2] %>" />
</jsp:include>
<%

            }else{ //admin
%>
<jsp:include page="admin-control.jsp">
    <jsp:param name="username"  value="<%= userData[1] %>" />
    <jsp:param name="image"  value="<%= userData[2] %>" />
</jsp:include>
<%
            }
        }
    }
%>
