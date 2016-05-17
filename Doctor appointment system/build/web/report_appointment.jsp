<%-- 
    Document   : report_appointment
    Created on : 18 ก.ย. 2552, 10:34:41
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.io.*,
           java.sql.*,
           java.util.*,
           database.*,
           net.sf.jasperreports.engine.*,
           net.sf.jasperreports.engine.export.*,
           net.sf.jasperreports.engine.design.*,
           net.sf.jasperreports.engine.xml.*,
           net.sf.jasperreports.view.*"
   %>

<%
    
    CreateConnection con = new CreateConnection();
    ResultSet result = null;
    String appointmentId = request.getParameter("aid");
    String patientId = "";
    String doctorId = "";
    String date = "";
    String time = "";
    String detail = "";

    String sql = "SELECT patientId,doctorId,date,time,detail FROM appointment WHERE appointmentId=?";
    PreparedStatement pre = con.getConnection().prepareStatement(sql);
    pre.setString(1, appointmentId);
    result = pre.executeQuery();

    if(result.first()){
        patientId = result.getString("patientId");
        doctorId = result.getString("doctorId");
        date = result.getString("date");
        time = result.getString("time");
        detail = result.getString("detail");
    }
    String dates = date.split("-")[2];
    String months = date.split("-")[1];
    String years = date.split("-")[0];
    int year = Integer.parseInt(years) + 543; //แปลงปีให้เป็น พ.ศ.
    date = year + "/" + months + "/" + dates; //วันที่จะแสดงใน report
    response.setContentType("application/pdf");

    Map parameters = new HashMap();
    parameters.put("patientId", patientId);
    parameters.put("doctorId", doctorId);
    parameters.put("date", date);
    parameters.put("time", time);
    parameters.put("detail", detail);
    InputStream inputStream = new FileInputStream(application.getRealPath("WEB-INF/classes/report_appointment.jasper"));
    JasperRunManager.runReportToPdfStream(inputStream, response.getOutputStream(), parameters, con.getConnection());
%>