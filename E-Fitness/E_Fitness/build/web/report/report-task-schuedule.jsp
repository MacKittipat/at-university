<%-- 
    Document   : index
    Created on : 6 ก.ค. 2552, 15:34:11
    Author     : Kittipat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" href="../css/custom-theme/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
        <script type="text/javascript" src="../lib/jquery/jquery.js"></script>
        <script type="text/javascript" src="../lib/jquery/jquery-ui-1.7.2.custom.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#txtStartDate").datepicker({dateFormat: 'yy-mm-dd'});
                $("#txtEndDate").datepicker({dateFormat: 'yy-mm-dd'});
               
            });
            function checkSelectDate()
            {
                 if(($("#txtStartDate").val() != null || $("#txtStartDate").val() != "" ) && ($("#txtEndDate").val() != null || $("#txtEndDate").val() != ""  ))
                {
                    
                }
            }
        </script>
        <style type="text/css">
            body{
                font-size:small;
                margin:0;
            }
            .ui-widget{
                font-size:10px;
            }
        </style>
    </head>
    <body>
        <%
            session.setAttribute("username", "mac");
            session.setAttribute("userId", "1");
        %>
        <form action="report-task-schuedule-pdf.jsp" method="post">
            <table>
                <tr>
                    <td>
                        Start Date
                    </td>
                    <td>
                        <input type="text" id="txtStartDate" name="startdate">
                    </td>
                </tr>
                <tr>
                    <td>
                        End Date
                    </td>
                    <td>
                        <input type="text" id="txtEndDate" name="enddate">
                    </td>
                </tr>
            </table>
            <input type="submit" value="View Report" name="submit">
        </form>
        <div id="a">

        </div>
    </body>
</html>
