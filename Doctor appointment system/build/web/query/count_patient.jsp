<%-- 
    Document   : count_patient
    Created on : 18 ก.ย. 2552, 19:44:41
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
        database.*"
%>

<%
    CreateConnection con = new CreateConnection();
    String sql = "SELECT COUNT(patientId) AS count FROM patient";
    PreparedStatement pre = con.getConnection().prepareStatement(sql);
    ResultSet result = pre.executeQuery();
    int countPatient = 0;
    if(result.first()){
        countPatient = result.getInt("count");
    }
    out.print(Math.ceil((float)countPatient/5.0f)); //5 doctor/page
%>
