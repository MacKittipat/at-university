<%-- 
    Document   : select_message
    Created on : 19 มิ.ย. 2552, 19:51:54
    Author     : Kittipat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<%
    request.setCharacterEncoding("utf-8");
    int limit = 20; // เอาไว้จำกัดจำนวนข้อความที่แสดง
    String msg = "";
    ResultSet resultCont = myBean.selectData("SELECT COUNT(*) AS rowcount FROM chatroom");
    resultCont.next();
    int start = resultCont.getInt("rowcount") - limit;
    ResultSet result = myBean.selectData("SELECT * FROM chatroom JOIN user WHERE chatroom.user_id = user.id  ORDER BY chatroom.datetime  LIMIT " + start + "," + limit); // join 2 table
    while(result.next())
    { // getDate and getTime เพื่อป้งกันการเติม .0 หลัง วินาที เมื่อใช้ getString("yyyy-mm-dd HH:MM:ss")
        msg += "<" + result.getDate("datetime") + " " + result.getTime("datetime") + "> " +  result.getString("username") + " : " +  result.getString("message") + "<br/>";
    }
    out.print(msg);
%>
