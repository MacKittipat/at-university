<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Field : Admin Only</title>
        <link rel="shortcut icon" href="images/favicon.ico">
        <link type="text/css" href="css/main.css" rel="stylesheet" />
        <!-- jQuery -->
            <link type="text/css" href="css/custom-theme/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
            <script type="text/javascript" src="lib/jquery/jquery.js"></script>
            <!--<script type="text/javascript" src="lib/jquery/jquery-ui-1.7.2.custom.min.js"></script>-->
            <script type="text/javascript" src="lib/timepicker/jquery.ui.all.js"></script>
        <!-- ****** -->
        <!-- liveQuery -->
            <script type="text/javascript" src="lib/livequery/jquery.livequery.js"></script>
        <!-- ****** -->
        <!-- custom jquery ui framework -->
            <link type="text/css" href="css/fg.menu.css" media="screen" rel="stylesheet" />
            <link type="text/css" href="css/fg-button.css" media="screen" rel="stylesheet" />
        <!-- ******** -->
        <script type="text/javascript" src="lib/admin_main.js"></script>
    </head>
    <body>
        <%
            try{
                String adminCheck = session.getAttribute("username").toString();
                if(!(adminCheck.equals("admin"))){
                    response.sendRedirect("first_page.jsp");
                }
            }catch(Exception e){
                response.sendRedirect("first_page.jsp");
            }

        %>
        <div id="container">
            <div id="header">

            </div>
            <div id="content">
                <div id="panel-left">
                    <div id="task-panel" class="ui-state-default">
                        <div class="ui-widget-header ui-corner-all ui-helper-clearfix">
                            <center><a class="header-section">Menu</a></center>
                        </div>
                        <fieldset id="task-detail-wrap">
                            <br />
                            <input type ="button" id = "btnIndex" value ="Go to Home" class="fg-button ui-state-default ui-corner-all" />
                            <br />
                            <br />
                            <input type ="button" id = "btnEdituser" value ="Manage User" class="fg-button ui-state-default ui-corner-all" />
                            <br />
                            <br />
                            <input type ="button" id = "btnReport" value ="Generate Report" class="fg-button ui-state-default ui-corner-all" />
                            <br />
                        </fieldset>
                    </div>
                </div>
                <div id="panel-right">
                    <div class="ui-widget-header ui-corner-all ui-helper-clearfix">
                        <center><font color="#1c94c4">Detail</font></center>
                    </div>
                    <fieldset id="reportAdmin" style =" display:none;width:700px;height:358px;overflow:scroll;" >
                        <%@include file="admin/report/report-user-list.jsp" %>
                    </fieldset>
                    <fieldset id="gridUser" style ="display:none;width:700px;overflow:scroll;" >
                        <%@include file="edituser_admin.jsp" %>
                    </fieldset>
                </div>
            </div>
            <div id="footer">
                <%@include file="page/component/footer.jspf" %>
            </div>
        </div>
    </body>
</html>
