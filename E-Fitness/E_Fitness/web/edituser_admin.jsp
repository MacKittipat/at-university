<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage User</title>
        <!-- jGrid -->
        <link rel="stylesheet" type="text/css" media="screen" href="lib/jgrid/theme/basic/grid.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="lib/jgrid/theme/jqModal.css" />
        <script src="lib/jgrid/jquery.jqGrid.js" type="text/javascript"></script>
        <script src="lib/jgrid/js/jqModal.js" type="text/javascript"></script>
        <script src="lib/jgrid/js/jqDnR.js" type="text/javascript"></script>
        <script src="lib/pages/edituser_admin.js" type="text/javascript"></script>
        <!-- ****** -->
    </head>
    <body>
        <table id="list" class="scroll"></table>
        <div id="pager" class="scroll" style="text-align:center;width:700px;"></div>
        <select name="searchType" id ="searchType">
            <option value ="username">Username</option>
            <option value ="email" >E-Mail</option>
            <option value ="name" >Name</option>
        </select> <span id="Gender_Status_Icon_1"></span>
        <input type ="text" id ="txtSearch" onkeyup="autoSubmit()" />
        <input type="checkbox" id="autosearch" onclick="enableAutosubmit(this.checked)"> Enable Autosearch
        <input type ="button" id = "btnSearch" onclick="gridReload()" value ="Search" />
        <br />
        <input type ="button" id ="btnEdit" value ="Edit" />
    </body>
</html>
