<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.util.Date"  %>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify E-Fitness ID</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("utf-8");

            ArrayList param = new ArrayList();
            String username = request.getParameter("username");
            String activateCode = request.getParameter("activateCode");
            
            param.add(username);
            param.add(activateCode);

            ResultSet rs = myBean.selectData("select * from user where username = ? and activate_code = ? ",param);
            rs.last();

            if(rs.getRow() == 1){
                ArrayList paramInsert = new ArrayList();
                paramInsert.add(1);
                paramInsert.add(username);
                int result = myBean.queryData("UPDATE user set active = ? where username = ?",paramInsert);
                response.sendRedirect("index.jsp");
            }else{
                out.println(rs.getRow());
            }
          
        %>
    </body>
</html>
