<%-- 
    Document   : count_doctor
    Created on : 14 ก.ย. 2552, 18:44:39
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
        database.*"
%>

<%
    CreateConnection con = new CreateConnection();
    String sql = "SELECT COUNT(doctorId) AS count FROM doctor";
    PreparedStatement pre = con.getConnection().prepareStatement(sql);
    ResultSet result = pre.executeQuery();
    int countDoctor = 0;
    if(result.first()){
        countDoctor = result.getInt("count");
    }
    out.print(Math.ceil((float)countDoctor/5.0f)); //5 doctor/page
%>