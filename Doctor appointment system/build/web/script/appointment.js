/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    //กด Make Appointment
    $("#btnAppointment").click(function(){
        var doctorId = $("#ddlDoctor").val();
        var date = $("#txtDate").val();
        var time = $("#ddlTime").val();
        var detail = $("#txtDetail").val();
        if(doctorId == "0"){
            $("#msg-select-doctor").html("Please choose doctor.");
        }else{
            $("#msg-select-doctor").html("");
        }
        if(date == ""){
            $("#msg-date").html("This field is required.");
        }else{
            $("#msg-date").html("");
        }
        if(time == "0"){
            $("#msg-select-time").html("Please choose time.");
        }else{
            $("#msg-select-time").html("");
        }
        if(doctorId != "0" && date != "" && time != "0"){
            $(".p-content").html("<img src='images/loading.gif' alt='loading' />");
            $.post("query/make_appointment.jsp", {
                doctorId:doctorId,
                date:date,
                time:time,
                detail:detail
            }, function(data){
                if($.trim(data)!="false"){
                    $(".p-content").html(data);
                }else{
                    $(".p-content").html("You are already appointment at this date and time. Please try again.");
                }
            });
        }
    });
    $("#txtDate").datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        yearRange: '1900:2009',
        minDate: new Date()
    });
    $("#txtDate").change(function(){
        var date = $("#txtDate").val();
        if(date == ""){
            $("#msg-date").html("This field is required.");
        }else{
            $("#msg-date").html("");
        }
    });
    //เลือก Department
    $("#ddlDepartment").change(function(){
        var departmentId = $("#ddlDepartment").val();
        $.post("query/select_doctor_name.jsp", {
            departmentId:departmentId
        }, function(data){
            $("#select-doctor").html(data);
        });
    });
    //เลือก Doctor
    $("#ddlDoctor").livequery(function(){
        $("#ddlDoctor").change(function(){
            var doctorId = $("#ddlDoctor").val();
            if(doctorId == "0"){
                $("#msg-select-doctor").html("Please choose doctor.");           
            }else{
                $("#msg-select-doctor").html("");
            }
            $.post("query/select_doctor_time.jsp", {
                doctorId:doctorId
            }, function(data){
                $("#select-time").html(data);
            });
        });
    });
    //เลือก Time
    $("#ddlTime").livequery(function(){
        $("#ddlTime").change(function(){
            var time = $("#ddlTime").val();
            if(time == "0"){
                $("#msg-select-time").html("Please choose time.");
            }else{
                $("#msg-select-time").html("");
            }
        });
    });
});
