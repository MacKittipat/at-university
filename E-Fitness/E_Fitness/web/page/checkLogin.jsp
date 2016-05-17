<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*,java.util.*,java.util.Date"  %>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            try{

                String username = request.getParameter("Lusername");
                String password = request.getParameter("Lpassword");
                String memId = "";
                String tempmemId = request.getParameter("rememberId");
                if(tempmemId != null)memId = tempmemId;
                String memPass = "";
                String tempmemPass = request.getParameter("rememberPass");
                if(tempmemPass != null)memPass = tempmemPass;

                if((username.equals("admin"))&&(password.equals("admin"))){
                    session.setAttribute("username", username);
                    response.sendRedirect("../admin_main.jsp");
                }else{
                    ArrayList param = new ArrayList();
                    param.add(username);
                    param.add(password);
                    ResultSet rs = myBean.selectData("select * from user where username = ? and password = ? ",param);
                    rs.last();
                    if(rs.getRow() == 1){
                        if(memPass.equals("memPass")){
                            
                        }
                        if(memId.equals("memId")){
                            Cookie efitness = null;
                            efitness = new Cookie("efitness",username);
                            efitness.setMaxAge(365*24*60*60);
                            response.addCookie(efitness);
                            System.out.println("Add Cookie");
                        }else{
                            Cookie efitness = null;
                            efitness = new Cookie("efitness",username);
                            efitness.setMaxAge(0);
                            response.addCookie(efitness);
                            System.out.println("Delete Cookie");
                        }
                        session.setAttribute("username", username);
                        response.sendRedirect("../home.jsp");
                    }

                    else{
                        out.println("Error");
                    }
                }
            }catch(Exception e){
                out.println(e);
            }
        %>
    </body>
</html>
