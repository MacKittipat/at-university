<%-- 
    Document   : select_view_patient
    Created on : 18 ก.ย. 2552, 19:54:15
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
                database.*"
        %>

<%
    CreateConnection con = new CreateConnection();
    String patientName = request.getParameter("name");
    ResultSet result = null;
    if(!patientName.equals("")){ //มีการส่ง name คือมีการ search
        String pageNum = request.getParameter("pageNum");//หมายเลขของเพจที่ดูอยู่
        //String sql = "SELECT patientId,name,lastname,birthdate,gender,weight,height,bloodGroup,address,telNumber,email,image FROM patient WHERE name=? ORDER BY patientId ASC LIMIT ?,5";
        //PreparedStatement pre = con.getConnection().prepareStatement(sql);
        //pre.setString(1, patientName);
        //pre.setInt(2, 0);

        //search แบบชื่อเหมือน
        String sql = "SELECT patientId,name,lastname,birthdate,gender,weight,height,bloodGroup,address,telNumber,email,image FROM patient WHERE name LIKE '%" + patientName + "%' ORDER BY patientId ASC LIMIT ?,5";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        pre.setInt(1,0);
        result = pre.executeQuery();       
    }else{//ไม่ได้ search
        String pageNum = request.getParameter("pageNum");//หมายเลขของเพจที่ดูอยู่
        String sql = "SELECT patientId,name,lastname,birthdate,gender,weight,height,bloodGroup,address,telNumber,email,image FROM patient ORDER BY patientId ASC LIMIT ?,5";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        pre.setInt(1, (Integer.parseInt(pageNum)*5)-5);
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
        String id = result.getString("patientId");
        String name = result.getString("name");
        String lastname = result.getString("lastname");
        String birthdate = result.getString("birthdate");
        String gender = result.getString("gender");
        String weight = result.getString("weight");
        String height = result.getString("height");
        String bloodGroup = result.getString("bloodGroup");
        String address = result.getString("address");
        String telNumber = result.getString("telNumber");
        String email = result.getString("email");
        String image = result.getString("image");
        out.print("<div style='padding:5px 5px 5px 5px;background-color:" + color + ";width:555px' id='patient-detail'>" +
                "<div><img style='width:80px;height:80px;' src='upload/patient/" + image + "' /></div>" +
                "<table>" +
                "<tr>" +
                "<td style='width:120px;'>Name</td><td style='width:200px;'>: <a href='admin_view_patient_detail.jsp?pid=" + id + "'>" + name + " " + lastname + "<a></td>" +
                "</tr>" +
                "<tr>" +
                "<td>Birthdate</td><td>: " + birthdate + "</td>" +
                "</tr>" +
                "<tr>" +
                "<td>Gender</td><td>: " + gender + "</td>" +
                "</tr>" +
                "<tr>" +
                "<td>Wieght / Height</td><td>: " + weight + " (kg.) / " + height + " (cm.)</td>" +
                "</tr>" +
                "<tr>" +
                "<td>Blood Group</td><td>: " + bloodGroup + "</td>" +
                "</tr>" +
                "<tr>" +
                "<td>Address</td><td>: " + address + "</td>" +
                "</tr>" +
                "<tr>" +
                "<td>Telephone Number</td><td>: " + telNumber + "</td>" +
                "</tr>" +
                "<tr>" +
                "<td>Email</td><td>: " + email + "</td>" +
                "</tr>" +
                "</table>" +
                "</div>");
        i++;
    }
    if(!result.first()){
        out.print("<div style='color:red;'>Not have patient.</div>");
    }
%>
