<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<jsp:useBean id="database" scope="request" class="bpm.QueryData"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Fitness Partner of Your Health</title>
        <!-- Body Raphael -->
            <script type="text/javascript" src="lib/raphael/raphael.js"></script>
            <script type="text/javascript" src="lib/raphael/body.js"></script>
        <!-- ************ -->
        <!-- Dropdown -->
            <script type="text/javascript" src="lib/dropdown/fg.menu.js"></script>
            <script type="text/javascript" src="lib/pages/dropdown.js"></script>
        <!-- ******** -->
    </head>
    <body>
        <!-- dropdown -->
        <a class="fg-button1 fg-button-icon-right ui-widget ui-state-default ui-corner-all" id="hierarchybreadcrumb">
            <span class="ui-icon ui-icon-triangle-1-s"></span>
            <span id="dropdown-text">Enjoy your exercise!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        </a>
        <div id="dropdown-organ" class="hidden">
            <ul id="main_menu">
                <%
                    ResultSet result_organ = database.selectData("SELECT organ_id,organ_name,hilight FROM organ");
                    while(result_organ.next())
                    {
                        out.println("<li id=\"organ"+ result_organ.getInt("organ_id") +"\" hilight=\""+result_organ.getString("hilight")+"\">");
                        out.println("<a href=\"#\" id=\"" + result_organ.getInt("organ_id") + "\" field=\"organ\" ");
                        out.println("text=\""+result_organ.getString("organ_name")+"\">" +result_organ.getString("organ_name") + "</a>");
                        ResultSet result_organ_detail = database.selectData("SELECT organ_detail_id,organ_detail_name,hilight FROM organ_detail WHERE organ_id='" + result_organ.getInt("organ_id") + "' ORDER BY organ_detail_id ASC");
                        result_organ_detail.last();

                        if(result_organ_detail.getRow() != 0)
                        {
                            out.println("<ul>");
                        }
                        result_organ_detail.beforeFirst();
                        while(result_organ_detail.next())
                        {
                            out.println("<li id=\"organ_detail"+ result_organ_detail.getInt("organ_detail_id") +"\" hilight=\""+result_organ_detail.getString("hilight")+"\">");
                            out.println("<a href=\"#\" id=\"" + result_organ_detail.getInt("organ_detail_id") + "\" field=\"organ_detail\" ");
                            out.println("text=\""+result_organ_detail.getString("organ_detail_name")+"\">" +result_organ_detail.getString("organ_detail_name") + "</a>");

                            ResultSet result_organ_method = database.selectData("SELECT organ_method_id,organ_method_name,organ_method_level,organ_method_type_name FROM organ_method JOIN organ_method_type ON organ_method_type = organ_method_type_id WHERE organ_detail_id='" + result_organ_detail.getInt("organ_detail_id") + "' ORDER BY organ_method_id ASC");
                            result_organ_method.last();
                            if(result_organ_method.getRow() != 0)
                            {
                                out.println("<ul>");
                            }
                            result_organ_method.beforeFirst();
                            while(result_organ_method.next())
                            {
                                out.println("<li id=\"organ_method"+ result_organ_method.getInt("organ_method_id") +"\">");
                                out.print("<a align=\"left\" href=\"#\"");
                                out.print("task=\""+result_organ_method.getString("organ_method_name")+"\" ");
                                out.print("type=\""+result_organ_method.getString("organ_method_type_name")+"\" ");
                                //out.print("path=\"path"+result_organ_detail.getInt("organ_detail_id")+"\" ");
                                out.print("level=\""+result_organ_method.getString("organ_method_level")+"\">" + result_organ_method.getString("organ_method_type_name")+" "+ result_organ_method.getString("organ_method_name") + "</a>");
                                out.println("</li>");
                            }
                            result_organ_method.last();
                            if(result_organ_method.getRow() != 0)
                            {
                                out.println("</ul>");
                            }
                            out.println("</li>");
                        }
                        result_organ_detail.last();
                        if(result_organ_detail.getRow() != 0)
                        {
                            out.println("</ul>");
                        }
                        out.println("</li>");
                    }
                %>
            </ul>
        </div>
        <!-- ******** -->
        <div id="paper"></div>
    </body>
</html>
