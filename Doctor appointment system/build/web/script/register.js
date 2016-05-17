/**
 * @author Kittipat_Mac
 */
var patientInfo = {
    idNumber:0,
    name:"",
    lastname:"",
    birthdate:"",
    gender:"",
    weight:0,
    height:0,
    bloodGroup:"",
    address:"",
    telNumber:"",
    email:"",
    image:"",
    username:"",
    password:""
};
$(document).ready(function(){
    //validate user form (form-regis-user)
    $(".form-regis-user").validate({
        rules:{
            txtEmail:{
                required:true,
                email:true
            },
            txtUsernames:{
                required:true,
                minlength:4,
                maxlength:16
            },
            txtPasswords:{
                required:true,
                minlength:4,
                maxlength:16
            },
            txtConfirmPassword:{
                required:true,
                minlength:4,
                maxlength:16,
                equalTo:"#txtPasswords"
            }
        },
        submitHandler:function(){ //กด Continue
            patientInfo.email = $("#txtEmail").val();
            patientInfo.username = $("#txtUsernames").val();
            patientInfo.password = $("#txtPasswords").val();
            //$(".p-content").html("<img src='images/loading.gif' alt='loading' />");
            $.post("query/check_username_patient.jsp", { //ตรวจสอบชื่อ Username ของ Patient ว่ามีอยู่แล้วหรือไม่
                username:patientInfo.username
            }, function(data){
                if(jQuery.trim(data)=="true"){ //Username ที่ส่งไปยังไม่มีใน DB จะไปยัง page ต่อไปได้
                    if($(".form-regis-user").valid()){
                        //var type = $("#ddlRegisterType").val(); //เก็บค่าชนิดของการสมัครว่าเป็น Patient/Doctor
                        $(".p-content").slideUp(function(){
                            //if(type=="Patient"){
                                $(".r-content h2").html("Patient Information");
                                $(".p-content").load("component/register-patient-info.jsp");
                            //}else{
                                //$(".r-content h2").html("Doctor Information");
                                //$(".p-content").load("component/register-doctor-info.jsp");
                            //}
                            $(".p-content").slideDown(function(){});
                            $("#txtBirthdate").livequery(function(){ //สร้าง Datepicker
                                $("#txtBirthdate").datepicker({
                                    dateFormat: 'yy-mm-dd',
                                    changeMonth: true,
                                    changeYear: true,
                                    yearRange: '1900:2009'
                                });
                            });
                            $("#uploadimage").livequery(function(){ //สร้าง file upload
                                var imageName = "";
                                new AjaxUpload('#uploadimage', {
                                    //action: 'upload.php',
                                    action:'query/upload.jsp', // I disabled uploads in this example for security reaaons
                                    name:'myimage',
                                    onSubmit:function(file , ext){
                                        if (ext && /^(jpg|png|jpeg|gif)$/.test(ext)){ //extension ของไฟล์เป็นรูปคือ upload ผ่านจะ disable
                                            //upload ได้แค่รูปเดียว
                                            this.disable();
                                        } else {
                                            // extension is not allowed
                                            $("#uploadmsg").livequery(function(){
                                                $("#uploadmsg").text(" Error only images are allowed");
                                            });
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
                            });
                            //validate patient form (form-regis-patient)
                            $("#form-regis-patient").livequery(function(){
                                $("#form-regis-patient").validate({
                                    rules:{
                                        txtIdNumber:{
                                            required:true,
                                            number:true,
                                            maxlength:13,
                                            minlength:13
                                        },
                                        txtName:{
                                            required:true
                                        },
                                        txtLastname:{
                                            required:true
                                        },
                                        txtBirthdate:{
                                            required:true,
                                            dateISO: true
                                        },
                                        txtWeight:{
                                            required:true,
                                            number:true
                                        },
                                        txtHeight:{
                                            required:true,
                                            number:true
                                        },
                                        txtAddress:{
                                            required:true
                                        },
                                        txtTelNumber:{
                                            required:true,
                                            number:true
                                        }
                                    },
                                    submitHandler:function(){ //กด Register
                                        patientInfo.idNumber = $("#txtIdNumber").val();
                                        patientInfo.name = $("#txtName").val();
                                        patientInfo.lastname = $("#txtLastname").val();
                                        patientInfo.birthdate = $("#txtBirthdate").val();
                                        patientInfo.gender = $("#ddlGender").val();
                                        patientInfo.weight = $("#txtWeight").val();
                                        patientInfo.height = $("#txtHeight").val();
                                        patientInfo.bloodGroup = $("#ddlBloodGroup").val();
                                        patientInfo.address = $("#txtAddress").val();
                                        patientInfo.telNumber = $("#txtTelNumber").val();
                                        patientInfo.image = $("#uploadmsg").html(); //ชื่อของรูปมาจาก #uploadmsg
                                        //alert(patientInfo.image);
                                        //ส่งค่าไป add ลง DB ใน register.jsp
                                        $(".p-content").html("<img src='images/loading.gif' alt='loading' />");
                                        $.post("query/register_patient.jsp", {
                                            idNumber:patientInfo.idNumber,
                                            name:patientInfo.name,
                                            lastname:patientInfo.lastname,
                                            birthdate:patientInfo.birthdate,
                                            gender:patientInfo.gender,
                                            weight:patientInfo.weight,
                                            height:patientInfo.height,
                                            bloodGroup:patientInfo.bloodGroup,
                                            address:patientInfo.address,
                                            telNumber:patientInfo.telNumber,
                                            image:patientInfo.image,
                                            email:patientInfo.email,
                                            username:patientInfo.username,
                                            password:patientInfo.password
                                        },function(){ //ทำงานเมือกด register
                                            $(".p-content").html("Register Complete");
                                        });
                                    }
                                });
                            });
                        });
                    }
                }else{
                    $("#usernamemsg").html("Username already in use");
                }
            });

        }
    }); //end from-regis-user
    
}); //end document.ready