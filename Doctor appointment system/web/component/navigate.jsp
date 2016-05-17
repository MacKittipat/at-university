<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.util.*"
%>
<%@include file="page-var.jsp" %>
<%
    // pages / pagesName มาจาก page-var.jsp
    String navigate = "<ul>";
    for(int i=0;i<pages.length;i++){
        navigate += "<li>";
        navigate += "<a href='" + pages[i] + "'>" + pagesName[i] + "</a>";
        navigate += "</li>";
    }
    navigate += "</ul>";
    out.print(navigate);
%>
