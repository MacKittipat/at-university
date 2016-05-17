<%-- 
    Document   : edit_admin
    Created on : 6 ก.ค. 2552, 17:51:39
    Author     : Ponlavat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <!-- jQuery -->
        <link rel="stylesheet" href="css/custom-theme/jquery-ui-1.7.2.custom.css" type="text/css" />
        <script src="../lib/jquery/jquery.js" type="text/javascript"></script>
        <script src="../lib/jquery/jquery-ui-1.7.2.custom.min.js" type="text/javascript"></script>
        <!-- ****** -->
        <!-- jGrid -->
        <link rel="stylesheet" type="text/css" media="screen" href="../lib/jgrid/theme/basic/grid.css" />
        <link rel="stylesheet" type="text/css" media="screen" href="../lib/jgrid/theme/jqModal.css" />
        <script src="../lib/jgrid/jquery.jqGrid.js" type="text/javascript"></script>
        <script src="../lib/jgrid/js/jqModal.js" type="text/javascript"></script>
        <script src="../lib/jgrid/js/jqDnR.js" type="text/javascript"></script>
        
        <!-- ****** -->
    </head>
    <body>
        <table id="list" class="scroll"></table>
        <div id="pager" class="scroll" style="text-align:center;"></div>
        <script type ="text/javascript">
        jQuery(document).ready(function(){
            jQuery("#list").jqGrid({
                url:'../page/edituserAdmin.jsp',
                datatype: 'xml',
                mtype: 'GET',
                colNames:['manage','id', 'username' ,'name', 'surname', 'birthday' , 'address' , 'phone' , 'create_date' , 'last_login_date', 'email' ,'active' , 'receiveNews'],
                colModel :[
                  {name:'act',index:'act', width:200,sortable:false,hidden:true},
                  {name:'id', index:'id'},
                  {name:'username', index:'username' , editable:false },
                  {name:'name', index:'name' , editable:true },
                  {name:'surname', index:'surname', editable:true },
                  {name:'birthday', index:'birthday', editable:true },
                  {name:'address', index:'address', align:'right' , editable:true },
                  {name:'phone', index:'phone', align:'right' , editable:true },
                  {name:'create_date', index:'create_date', align:'right' , editable:true },
                  {name:'last_login_date', index:'last_login_date', align:'right' , editable:true },
                  {name:'email', index:'email', align:'right' , editable:true },
                  {name:'active', index:'active',  align:'right' , editable:true },
                  {name:'receiveNews', receiveNews:'phone', align:'right' , editable:true }],
                pager: jQuery('#pager'),
                rowNum:10,
                rowList:[10,20,30],
                height: "100%",
                sortname: 'id',
                sortorder: "asc",
                viewrecords: true,
                imgpath: '../lib/jgrid/theme/basic/images',
                caption: 'My first grid',
                loadComplete: function(){
                    var ids = jQuery("#list").getDataIDs();
                    for(var i=0;i<ids.length;i++){
                        var cl = ids[i];
                        be = "<input type='button' value='Edit' onclick='editButton(" + cl + ")' ></ids>";
                        se = "<input type='button' value='Save' onclick= 'saveButton(" + cl + ")'/>";
                        ce = "<input type='button' value='Cancle' onclick='cancleButton(" + cl + ")' />";
                        jQuery("#list").setRowData(ids[i],{act:be+se+ce})
                    }
                },
                editurl:"../page/edituserAdmin.jsp"
            });
        });
        </script>
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
