<?xml version="1.0" encoding="utf-8"?>
<%@page contentType="text/xml" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"  %>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<%
    //String userId = session.getAttribute("userId").toString
    String userId = "1";
    ArrayList param = new ArrayList();
    param.add(userId);
    ResultSet result =  myBean.selectData("SELECT * FROM calendar WHERE user_id=?",param);
    out.print("<data>");
    while(result.next())
    {
        String id = new String(result.getString("id").getBytes("utf-8"), "utf-8");
        String startDate = new String(result.getString("start_date").getBytes("utf-8"), "utf-8");
        String endDate = new String(result.getString("end_date").getBytes("utf-8"), "utf-8");
        String text = new String(result.getString("text").getBytes("utf-8"), "utf-8");
        String details = new String(result.getString("details").getBytes("utf-8"), "utf-8");
        String calories = "";
        try{
            calories = new String(result.getString("calories").getBytes("utf-8"), "utf-8");
        }
        catch(Exception e)
        {}
        
        out.print("<event id='" + id + "'>");
        out.print("<start_date><![CDATA[" + startDate + "]]></start_date>");
        out.print("<end_date><![CDATA[" + endDate + "]]></end_date>");
        out.print("<text><![CDATA[" + text + "]]></text>");
        out.print("<details><![CDATA[" + details + "]]></details>");
        out.print("<calories><![CDATA[" + calories + "]]></calories>");
        out.print("</event>");
    }
    out.print("</data>");
%>