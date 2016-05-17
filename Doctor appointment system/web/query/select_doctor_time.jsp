<%-- 
    Document   : select_doctor_time
    Created on : 15 ก.ย. 2552, 19:59:48
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
                database.*"
        %>

<%
    String doctorId = request.getParameter("doctorId");
    CreateConnection con = new CreateConnection();
    ResultSet result = null;
    if(doctorId.equals("0")){//0 คือ ไม่ได้เลือก doctor
%>
 <select id="ddlTime" style="width:255px;">
    <option value="0">
    &lt;&lt;&lt; Choose Time &gt;&gt;&gt;
    </option>
</select>
<%
    }else{//เลือก doctor
        String sql = "SELECT time FROM worktime WHERE doctorId=?";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        pre.setString(1, doctorId);
        result = pre.executeQuery();
        out.print("<select id='ddlTime' style='width:255px;'>");
        out.print("<option value='0'>&lt;&lt;&lt; Choose Time &gt;&gt;&gt;</option>");
        while(result.next()){
            out.print("<option value='" + result.getString("time") + "'>" + result.getString("time") + "</option>");
        }
        out.print("</select>");
    }

%>
