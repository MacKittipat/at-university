<%-- 
    Document   : deletedata
    Created on : Jun 12, 2009, 1:57:52 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"  %>

<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<%
    String id = new String(request.getParameter("id").getBytes("utf-8"), "utf-8");
    ArrayList param = new ArrayList();
    param.add(id);
    param.add(id); // auto_id เอาไว้แก้ ตอนที่สร้าง event ใหม่แล้วต้องการลบ id จะหา id ไม่เจอจึงต้องหา auto_id แทนเพราะ event ทีสร้างใหม่จะมีแต่ auto_id
    int result = myBean.queryData("DELETE FROM calendar WHERE id=? or auto_id=?",param);
%>