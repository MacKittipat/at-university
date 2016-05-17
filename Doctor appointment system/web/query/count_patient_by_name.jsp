<%-- 
    Document   : count_patient_by_name
    Created on : 19 ก.ย. 2552, 14:16:39
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
                database.*"
        %>

<%
    String name = request.getParameter("name");
    CreateConnection con = new CreateConnection();
    String sql = "SELECT COUNT(name) as count FROM patient WHERE name=?";
    PreparedStatement pre = con.getConnection().prepareStatement(sql);
    pre.setString(1, name);
    ResultSet result = pre.executeQuery();
    int countPatient = 0;
    if(result.first()){
        countPatient = result.getInt("count");
    }
    out.print(Math.ceil((float)countPatient/5.0f)); //5 doctor/page
%>
