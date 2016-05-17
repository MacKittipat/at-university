<%-- 
    Document   : count_doctoy_by_department
    Created on : 15 ก.ย. 2552, 13:17:33
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
        database.*"
%>

<%
    String departmentId = request.getParameter("departmentId");
    CreateConnection con = new CreateConnection();
    String sql = "SELECT COUNT(doctorId) AS count FROM doctor WHERE departmentId=?";
    PreparedStatement pre = con.getConnection().prepareStatement(sql);
    pre.setString(1, departmentId);
    ResultSet result = pre.executeQuery();
    int countDoctor = 0;
    if(result.first()){
        countDoctor = result.getInt("count");
    }
    out.print(Math.ceil((float)countDoctor/5.0f)); //5 doctor/page
%>
