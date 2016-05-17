    var checkB = "false";
    var lastsel;
    var hide = "true";
    var updateTable = "user";
    jQuery(document).ready(function(){
            jQuery("#list").jqGrid({
                url:'page/edituserAdmin.jsp',
                datatype: 'xml',
                mtype: 'GET',
                colNames:['manage','id', 'username' ,'name', 'surname', 'birthday' , 'address' , 'phone' , 'create_date' , 'last_login_date', 'email' ,'active' , 'receiveNews'],
                colModel :[
                  {name:'act',index:'act',sortable:false,hidden:true},
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
                imgpath: 'lib/jgrid/theme/basic/images',
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
                editurl:"page/edituserAdmin.jsp"
            });
        $("#btnCheck").click(function(){
            var s = "";
            s = $("#list").getGridParam("selarrrow");
            var ss = "" + s;
            var ts = ss.split(",");
            alert(ts.length);
        });

        $("#btnEdit").click(function(){
            if(hide == "true"){
                jQuery("#list").showCol("act");
                hide = "false";
            }else{
                jQuery("#list").hideCol("act");
                hide = "true";
            }
        });
    });

    function editButton(cl){
        jQuery('#list').editRow(cl);
    }
    function saveButton(cl){
        jQuery('#list').saveRow(cl);
        var sl = $("#list").getRowData(cl);
        $.post("page/updateuserAdmin.jsp",{
            row_id:sl.id,
            row_name:$("#"+ cl +"_name").val(),
            row_surname:$("#"+ cl +"_surname").val(),
            row_birthday:$("#"+ cl +"_birthday").val(),
            row_address:$("#"+ cl +"_address").val(),
            row_phone:$("#"+ cl +"_phone").val(),
            row_create_date:$("#"+ cl +"_create_date").val(),
            row_last_login_date:$("#"+ cl +"_last_login_date").val(),
            row_email:$("#"+ cl +"_email").val(),
            row_active:$("#"+ cl +"_active").val(),
            row_receiveNews:$("#"+ cl +"_receiveNews").val()
        },function(){});
    }
    function cancleButton(cl){
        jQuery('#list').restoreRow(cl);
    }

    function autoSubmit(){
          if(checkB == true){
              gridReload();
          }
    }

    function gridReload(){
        var type = $("#searchType").val();
        var value = jQuery("#txtSearch").val();
        jQuery("#list").setGridParam({url:"page/searchuserAdmin.jsp?type="+type+"&"+type+"="+value,page:1}).trigger("reloadGrid");
    }

    function enableAutosubmit(state){
        checkB = state;
        jQuery("#btnSearch").attr("disabled",state);
    }


