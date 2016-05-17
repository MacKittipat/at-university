/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    new AjaxUpload('#uploadimage', {
        action:'query/upload.jsp', // I disabled uploads in this example for security reaaons
        name:'myimage',
        data:{
            type:"doctor"
        },
        onSubmit:function(file , ext){
            if (ext && /^(jpg|png|jpeg|gif)$/.test(ext)){ //extension ของไฟล์เป็นรูปคือ upload ผ่านจะ disable
                //upload ได้แค่รูปเดียว
                this.disable();
            } else {
                // extension is not allowed
                $("#uploadmsg").text(" Error only images are allowed");
                // cancel upload
                return false;
            }
        },
        onComplete : function(file, response){
            if(response==""){ //response ว่างคือไม่ error (ขนาดรูปไม่ใหญ่เกินไป)
                $("#uploadmsg").text(" " + file); //file คือชื่อรูปที่ถูก upload แล้ว

            }else{ //response ไม่ว่างจะแสดงข้อความเตือนขนาดรูป
                $("#uploadmsg").text(" " + response);
            }
        }
    });
    $(".form-regis-doctor").validate({
        rules:{
            txtName:{
                required:true
            },
            txtLastname:{
                required:true
            },
            txtTelNumber:{
                required:true,
                number:true
            },
            txtEmail:{
                required:true,
                email:true
            }
        },
        submitHandler:function(){
            var name = $("#txtName").val();
            var lastname = $("#txtLastname").val();
            var gender = $("#ddlGender").val();
            var telNumber = $("#txtTelNumber").val();
            var email = $("#txtEmail").val();
            var departmentId = $("#ddlDepartment").val();
            var image = $("#uploadmsg").html();
            var time = new Array();
            var j = 0;
            for(var i=1;i<=10;i++){//เก็บค่าเวลาที่ admin เลือก
                if($("#chkTime" + i).attr("checked")){
                    time[j] = $("#chkTime" + i).val();
                    j++;
                }
            }
            $(".p-content").html("<img src='images/loading.gif' alt='loading' />");
            $.post("query/register_doctor.jsp", {
                name:name,
                lastname:lastname,
                gender:gender,
                telNumber:telNumber,
                email:email,
                departmentId:departmentId,
                image:image,
                time:time
            },function(){
                $(".p-content").html("Register Complete");
            });
        }
    }); //end form-regis-doctor
}); //end document.ready

