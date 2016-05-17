<%-- 
    Document   : viewreport
    Created on : 6 ก.ค. 2552, 19:39:39
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
        <title>View Report</title>
    </head>
    <body>
            <div>
        <%
            response.setContentType("text/html");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection ("jdbc:mysql://localhost/efitness","root","root");

            String userId = session.getAttribute("userId").toString();
            String startdate = request.getParameter("startdate") + " " + "00:00:00";
            String enddate = request.getParameter("enddate") + " " + "00:00:00";

            Map parameters = new HashMap();
            parameters.put("userId", userId);
            parameters.put("startdate", startdate);
            parameters.put("enddate", enddate);
            
            InputStream inputStream = new FileInputStream(new File(application.getRealPath("WEB-INF/classes/efitness_report.jasper")));
            JasperPrint jasperPrint = JasperFillManager.fillReport(inputStream,parameters,con);
            
            Map imagesMap = new HashMap();
            request.getSession().setAttribute("IMAGES_MAP", imagesMap);

            JRHtmlExporter export = new JRHtmlExporter();
            export.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
            export.setParameter(JRExporterParameter.OUTPUT_WRITER, response.getWriter());
            export.setParameter(JRHtmlExporterParameter.IMAGES_MAP, imagesMap);
            export.setParameter(JRHtmlExporterParameter.IMAGES_URI,"../images/e-Fitness.gif?image=");
            export.setParameter(JRHtmlExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.FALSE);
            export.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, Boolean.FALSE);
            export.exportReport();
            con.close();
 
        %>
        </div>
    </body>
</html>
