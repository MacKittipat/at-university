<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/favicon.ico">
        <link type="text/css" href="css/main.css" rel="stylesheet" />
        <!-- jQuery -->
            <link type="text/css" href="css/custom-theme/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
            <script type="text/javascript" src="lib/jquery/jquery.js"></script>
            <!--<script type="text/javascript" src="lib/jquery/jquery-ui-1.7.2.custom.min.js"></script>-->
            <script type="text/javascript" src="lib/timepicker/jquery.ui.all.js"></script>
        <!-- ****** -->
        <script type="text/javascript" src="lib/main.js"></script>
        <!-- liveQuery -->
            <script type="text/javascript" src="lib/livequery/jquery.livequery.js"></script>
        <!-- ****** -->
        <!-- custom jquery ui framework -->
            <link type="text/css" href="css/fg.menu.css" media="screen" rel="stylesheet" />
            <link type="text/css" href="css/fg-button.css" media="screen" rel="stylesheet" />
        <!-- ******** -->
        <!-- timepicker -->
            <link rel="Stylesheet" media="screen" href="css/timepicker/ui.timepickr.css">
            <script type="text/javascript" src="lib/timepicker/jquery.utils.js"></script>
            <script type="text/javascript" src="lib/timepicker/jquery.strings.js"></script>
            <script type="text/javascript" src="lib/timepicker/ui.dropslide.js"></script>
            <script type="text/javascript" src="lib/timepicker/ui.timepickr.js"></script>
        <!-- ********* -->
        <title>E-Fitness Partner of Your Health</title>
    </head>
    <body>
        <div id="container">
            <div id="header">
                <%@include file="page/component/menu-bar.jspf" %>
            </div>
            <div id="content">
                <div id="panel-left">
                    <div id="login-panel">
                        <%@include file="page/component/login.jsp" %>
                    </div>
                    <div id="task-panel" class="ui-state-default">
                        <div class="ui-widget-header ui-corner-all ui-helper-clearfix">
                            <center><a class="header-section">Task Schedule</a></center>
                        </div>
                        <fieldset id="task-detail-wrap">
                            <div id="task-detail">No Task</div>
                        </fieldset>
                    </div>
                </div>
                <div id="panel-right">
                    <div class="ui-widget-header ui-corner-all ui-helper-clearfix">
                        <center><font id="header-content" color="#1c94c4">Choose your task</font></center>
                    </div>
                    <fieldset id="content-wrap">
                        <%@include file="dropdown.jsp" %>
                    </fieldset>
                </div>
            </div>
            <div id="footer">
                <%@include file="page/component/footer.jspf" %>
            </div>
        </div>
    </body>
</html>
