/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    //patient
    $("#btnPatientMore").click(function(){
        if($("#patient-more").css("display")=="none"){ //แสดงรายละเอียด
            $("#patient-more").slideDown("fast");
            $("#btnPatientMore").html("Hide");
        }else{//ซ่อนรายละเอียด
            $("#patient-more").slideUp("fast");
            $("#btnPatientMore").html("More");
        }
    });
    //doctor
    $("#btnDoctorMore").click(function(){
        if($("#doctor-more").css("display")=="none"){ //แสดงรายละเอียด
            $("#doctor-more").slideDown("fast");
            $("#btnDoctorMore").html("Hide");
        }else{//ซ่อนรายละเอียด
            $("#doctor-more").slideUp("fast");
            $("#btnDoctorMore").html("More");
        }
    });
});

