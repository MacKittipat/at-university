<%-- 
    Document   : select_doctor_name
    Created on : 15 ก.ย. 2552, 18:29:26
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
                database.*"
        %>

<%
    String departmentId = request.getParameter("departmentId");
    CreateConnection con = new CreateConnection();
    ResultSet result = null;
    if(departmentId.equals("0")){//department เป็น 0 คือ ไม่ได้เลือก department ใดจะแสดง doctor ทั้งหมด
        String sql = "SELECT doctorId,name,lastname FROM doctor";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        result = pre.executeQuery();
    }else{//department ไม่เป็น 0 คือมีการเลือก department จะแสดงหมอใน department นั้นๆ
        String sql = "SELECT doctorId,name,lastname FROM doctor WHERE departmentId=?";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        pre.setString(1, departmentId);
        result = pre.executeQuery();
    }
    out.print("<select id='ddlDoctor' style='width:335px;'>");
    out.print("<option value='0'>&lt;&lt;&lt; Choose Doctor &gt;&gt;&gt;</option>");
    while(result.next()){
        out.print("<option value='" + result.getString("doctorId") + "'>" + result.getString("name") + " " + result.getString("lastname") + "</option>");
    }
    out.print("</select>");
%>