<%-- 
    Document   : viewreportadmin
    Created on : 8 ก.ค. 2552, 19:25:14
    Author     : Kittipat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   <%@page import="
   java.io.*,
   java.sql.*,
   java.util.*,
   net.sf.jasperreports.engine.*,
   net.sf.jasperreports.engine.export.*,
   net.sf.jasperreports.engine.design.*,
   net.sf.jasperreports.engine.xml.*,
   net.sf.jasperreports.view.*
" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String radActive = request.getParameter("radActive");
            String active1 ="";
            String active2 ="";
            if(radActive.equals("active"))
            {
                active1 = "1";
                active2 = "1";
            }
            else if(radActive.equals("unactive"))
            {
                active1 = "0";
                active2 = "0";
            }
            else
            {
                active1 = "0";
                active2 = "1";
            }
            response.setContentType("application/pdf");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection ("jdbc:mysql://localhost/efitness","root","root");
            Map parameters = new HashMap();
            parameters.put("active1", active1);
            parameters.put("active2", active2);
            InputStream inputStream = new FileInputStream(application.getRealPath("WEB-INF/classes/efitness_report_admin.jasper"));
            JasperRunManager.runReportToPdfStream(inputStream, response.getOutputStream(), parameters, con);
            con.close();
        %>
    </body>
</html>
