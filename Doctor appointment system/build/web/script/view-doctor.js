/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var myvar = {
    pageNum:0
}; //จำนวน page สำหรับแสดง link paging

$(document).ready(function(){
    //หาจำนวน doctor ทำงานเมื่อเข้ามาที่ viewdoctor เป็นครั้งแรก
    $.get("query/count_doctor.jsp",function(data){
        var departmentId = $("#ddlDepartment").val();
        myvar.pageNum = $.trim(data);
        //โชว์ข้อมูลหมอ
        $("#doctor-list").html("<img src='images/loading.gif' alt='loading' />");
        $.post("query/select_view_doctor.jsp",{
            pageNum:1,
            departmentId:departmentId
        },function(data){
            $("#doctor-list").html(data);
        });
        //กด pager
        $("#pager").pager({ pagenumber: 1, pagecount: myvar.pageNum, buttonClickCallback: PageClick });
    });
    //กด ddl เพื่อเลือก department
    $("#ddlDepartment").change(function(){
        var departmentId = $("#ddlDepartment").val();
        if(departmentId!="0"){//มีการเลือก department
            $("#doctor-list").html("<img src='images/loading.gif' alt='loading' />");
            $.post("query/count_doctoy_by_department.jsp", {
                departmentId:departmentId
            }, function(data){
                var pageCount = $.trim(data);
                //var departmentId = $("#ddlDepartment").val();
                $("#doctor-list").html("<img src='images/loading.gif' alt='loading' />");
                $.post("query/select_view_doctor.jsp",{
                    pageNum:1,
                    departmentId:departmentId
                }, function(data){
                    $("#doctor-list").html(data);
                    $("#pager").pager({ pagenumber: 1, pagecount: pageCount, buttonClickCallback: PageClick });
                });

            });
        }else{//ทำงานเหมือนตอนเข้ามาในเพจ viewdoctor ใหม่คือกดเลือก choose department
            $.get("query/count_doctor.jsp",function(data){
                var departmentId = $("#ddlDepartment").val();
                myvar.pageNum = $.trim(data);
                //โชว์ข้อมูลหมอ
                $("#doctor-list").html("<img src='images/loading.gif' alt='loading' />");
                $.post("query/select_view_doctor.jsp",{
                    pageNum:1,
                    departmentId:departmentId
                },function(data){
                    $("#doctor-list").html(data);
                });
                //กด pager
                $("#pager").pager({ pagenumber: 1, pagecount: myvar.pageNum, buttonClickCallback: PageClick });
            });
        }
    });
});
//ทำเมื่อมีการกด paging
PageClick = function(pageclickednumber) {
    var departmentId = $("#ddlDepartment").val();
    $("#doctor-list").html("<img src='images/loading.gif' alt='loading' />");
    $.post("query/select_view_doctor.jsp",{
        pageNum:pageclickednumber,
        departmentId:departmentId
    },function(data){
        $("#doctor-list").html(data);
    });
    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: myvar.pageNum, buttonClickCallback: PageClick });
    //$("#doctor-list").html("Clicked Page " + pageclickednumber);
}
