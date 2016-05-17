<%-- 
    Document   : insert_user_login
    Created on : 21 มิ.ย. 2552, 9:48:57
    Author     : Kittipat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<%
    request.setCharacterEncoding("utf-8");
    String userId = request.getParameter("userid");
    // เช็คว่า userid ที่ส่งมามีอยู่ใน table login หรือไม่ถ้ามีก็จะไม่ insert เพราะจำทำให้มี userid เดิมหลาย row
    ArrayList param1 = new ArrayList();
    param1.add(userId);
    ResultSet result1 = myBean.selectData("SELECT * FROM login WHERE user_id=?",param1);
    if(!result1.next()) // ถ้ามี userid นี้ใน table login แล้วจะไม่ insert
    {
        ArrayList param2 = new ArrayList();
        param2.add(userId);
        int result2 = myBean.queryData("INSERT INTO login(user_id) VALUES(?)", param2);
    }
%>