<%-- 
    Document   : index
    Created on : 6 ก.ค. 2552, 14:26:32
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
        <title>Report</title>
    </head>
    <body>
        <%

/*
             response.setContentType("application/pdf");
            String userId = session.getAttribute("userId").toString();
            String startdate = request.getParameter("startdate") + " " + "00:00:00";
            String enddate = request.getParameter("enddate") + " " + "00:00:00";
            
            Map parameters = new HashMap();
            parameters.put("userId", userId);
            parameters.put("startdate", startdate);
            parameters.put("enddate", enddate);
            reportBean.createPdfReportOnPage(application.getRealPath("WEB-INF/classes/efitness_report.jasper"), response.getOutputStream() , parameters);
 */

            String userId = session.getAttribute("userId").toString();
            String startdate = request.getParameter("startdate") + " " + "00:00:00";
            String enddate = request.getParameter("enddate") + " " + "00:00:00";
            response.setContentType("application/pdf");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection ("jdbc:mysql://localhost/efitness","root","root");
            Map parameters = new HashMap();
            parameters.put("userId", userId);
            parameters.put("startdate", startdate);
            parameters.put("enddate", enddate);
            InputStream inputStream = new FileInputStream(application.getRealPath("WEB-INF/classes/efitness_report.jasper"));
            JasperRunManager.runReportToPdfStream(inputStream, response.getOutputStream(), parameters, con);
            con.close();
        %>
    </body>
</html>
