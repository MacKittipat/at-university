/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

var myvar = {
    pageNum:0
}; //จำนวน page สำหรับแสดง link paging

$(document).ready(function(){
    //หาจำนวน patient เมื่อเข้ามาเป็นครั้งแรก(หาจำนวน pager)
    $.get("query/count_patient.jsp", function(data){
        myvar.pageNum = $.trim(data);
        //โชว์ข้อมูล patient
        $("#patient-list").html("<img src='images/loading.gif' alt='loading' />");
        $.post("query/select_view_patient.jsp", {
            pageNum:1,
            name:""
        }, function(data){
            $("#patient-list").html(data);
            //กด pager
            $("#pager").pager({ pagenumber: 1, pagecount: myvar.pageNum, buttonClickCallback: PageClick });
        });
    });
    //Search
    $("#btnSearch").click(function(){
        var name = $.trim($("#txtName").val());
        if(name!=""){ //ถ้าไม่ใส่ name จะไม่สามารถ search ได้
            //นับจำนวน pager หลังจากการ search
            $.post("query/count_patient_by_name.jsp", {
                name:name
            }, function(data){
                var pageCount = $.trim(data);
                $("#patient-list").html("<img src='images/loading.gif' alt='loading' />");
                $.post("query/select_view_patient.jsp", {
                    pageNum:1,
                    name:name
                }, function(data){
                    $("#patient-list").livequery(function(){
                        $("#patient-list").html(data);
                        $("#pager").pager({ pagenumber: 1, pagecount: pageCount, buttonClickCallback: PageClick });
                    });
                });
            });    
        }
    });
    //show all
    $("#btnShowAll").click(function(){
        //ทำเหมือนตอนเข้ามาในเพจนี้ครั้งแรก
        $.get("query/count_patient.jsp", function(data){
            myvar.pageNum = $.trim(data);
            //โชว์ข้อมูล patient
            $("#patient-list").html("<img src='images/loading.gif' alt='loading' />");
            $.post("query/select_view_patient.jsp", {
                pageNum:1,
                name:""
            }, function(data){
                $("#patient-list").html(data);
                //กด pager
                $("#pager").pager({ pagenumber: 1, pagecount: myvar.pageNum, buttonClickCallback: PageClick });
            });
        });
    });
});
//ทำเมื่อมีการกด paging
PageClick = function(pageclickednumber) {
    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: myvar.pageNum, buttonClickCallback: PageClick });
    $("#patient-list").html("<img src='images/loading.gif' alt='loading' />");
    $.post("query/select_view_patient.jsp", {
        pageNum:pageclickednumber,
        name:""
    }, function(data){
        $("#patient-list").html(data);
    });
    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: myvar.pageNum, buttonClickCallback: PageClick });
}