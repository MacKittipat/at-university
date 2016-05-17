<%-- 
    Document   : select_view_doctor
    Created on : 14 ก.ย. 2552, 19:06:35
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
                database.*"
        %>

<%
    CreateConnection con = new CreateConnection();
    ResultSet result = null;
    String departmentId = request.getParameter("departmentId");
    if(departmentId.equals("0")){
        String pageNum = request.getParameter("pageNum");//หลามเลขของเพจที่ดูอยู่
        String sql = "SELECT doctor.doctorId,doctor.name,doctor.lastname,doctor.gender,doctor.telNumber,doctor.email,doctor.image FROM doctor ORDER BY doctor.doctorId ASC LIMIT ?,5";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        pre.setInt(1, (Integer.parseInt(pageNum)*5)-5);
        result = pre.executeQuery();
    }else{
        String pageNum = request.getParameter("pageNum");//หลามเลขของเพจที่ดูอยู่
        String sql = "SELECT doctor.doctorId,doctor.name,doctor.lastname,doctor.gender,doctor.telNumber,doctor.email,doctor.image FROM doctor WHERE departmentId=? ORDER BY doctor.doctorId ASC LIMIT ?,5";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        pre.setString(1, departmentId);
        pre.setInt(2, 0);
        result = pre.executeQuery();
    }
    String color = "#ebebeb";
    int i = 0;
    while(result.next()){
        if(i % 2 == 0){
            color = "#ffffff";
        }else{
            color = "#ebebeb";
        }
       
        String id = result.getString("doctor.doctorId");          
        String name = result.getString("doctor.name");
        String lastname = result.getString("doctor.lastname");
        String gender = result.getString("doctor.gender");
        String telNumber = result.getString("doctor.telNumber");
        String email = result.getString("doctor.email");
        String image = result.getString("doctor.image");
        out.print("<div style='padding:5px 5px 5px 5px;background-color:" + color + ";width:555px' id='doctor-detail'>" +
                "<div><img style='width:80px;height:80px;' src='upload/doctor/" + image + "' alt='" + name + "' /></div>" +
                "<table>" +
                "<tr>" +
                "<td style='width:120px;'>Name<td>" +
                "<td style='width:200px;'>: <a href='view_doctor_detail.jsp?did=" + id + "'>" + name + " " + lastname + "</a><td>" +
                "</tr>" +
                "<tr>" +
                "<td>Telephone Number<td>" +
                "<td>: " + telNumber + "<td>" +
                "</tr>" +
                "<tr>" +
                "<td>Email<td>" +
                "<td>: " + email + "<td>" +
                "</tr>" +
                "</table>" +
                "</div>");
        i++;
    }
%>
