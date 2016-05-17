
        var validateOK = '<img src="images/icon-ok.gif" height="16" width="16" />';
        var validating = '<img src="images/ajax-loader-spin.gif" height="16" width="16" />';
        var outRequire = '<img src="images/icon-require.gif" height="14" width="210" />';
        var validateFalse = '<img src="images/icon-false.gif" height="16" width="16" />';

        var outUser = "This field cann't be NULL";
        var outPass = "This field cann't be NULL";
        var outCPass = "This field cann't be NULL";
        var outEmail = "This field cann't be NULL";
        $(document).ready(function()
		{

            $('#txtUsername').keyup(function(){Update_Username_Validate_Status(this)});
            $('#txtOPassword').keyup(function(){Update_OPassword_Validate_Status(this)});
            $('#txtPassword').keyup(function(){Update_Password_Validate_Status(this)});
            $('#txtCPassword').keyup(function(){Update_CPassword_Validate_Status(this)});
            $('#txtEmail').keyup(function(){Update_Email_Validate_Status(this)});
            $('#txtName').keyup(function(){Update_Name_Validate_Status(this)});
            $('#txtSurname').keyup(function(){Update_Name_Validate_Status($('#txtName'))});
            $('#ddGender').change(function(){Update_Gender_Validate_Status(this)});
            //
            $('#datepicker').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'yy-mm-dd',
                yearRange:'1959:2009'
            });
            
            //
            
            $('#datepicker').change(function(){
                Update_Birthday_Validate_Status(this);
            });
            $('#txtAddress').keyup(function(){Update_Address_Validate_Status(this)});
            $('#area_code').keyup(function(){Update_Phone_Validate_Status(this)});
            $('#number1').keyup(function(){Update_Phone_Validate_Status(this)});
            $('#number2').keyup(function(){Update_Phone_Validate_Status(this)});
            //
            $('#area_code').autotab({ target: 'number1', format: 'numeric' });
            $('#number1').autotab({ target: 'number2', format: 'numeric', previous: 'area_code' });
            $('#number2').autotab({ previous: 'number1', format: 'numeric' });
            //
            $("#btnSubmit").click(function(){
                
                if(validateAll()){
                    $("#editForm").fadeOut("fast");
                    $("#editWait").fadeIn(500);
                    $("#loading").html(validating);
                    var phoneNum = $('#area_code').val() + $('#number1').val() + $('#number2').val();
                    $.post("page/validateEdit.jsp",{
                        type : "submit",
                        username: $('#txtUsername').val(),
                        password:  $('#txtPassword').val(),
                        email:  $('#txtEmail').val(),
                        name: $('#txtName').val(),
                        surname: $('#txtSurname').val(),
                        gender: document.getElementById('ddGender')[document.getElementById('ddGender').selectedIndex].value ,
                        birthday: $('#datepicker').val(),
                        address: $('#txtAddress').val(),
                        phone: phoneNum ,
                        receive: $("input[name='receive']:checked").val()
                     },function(tresultC){
                        var resultC = parseInt(tresultC);
                        if(resultC == 1){
                            $("#editWait").fadeOut(500);
                            $("#editSuccess").fadeIn(500);
                        }else{
                            $("#editWait").fadeOut(500);
                            $("#editError").fadeIn(500);
                        }
                     });
            }
        });
            $("#btnSuccess").click(function(){
                window.location = "http://localhost:8080/E_Fitness/";
            });
            
        });

        function Update_Email_Validate_Status(field)
		{
            var t = field;
            if (t.value != t.lastValue)
			{
                if (t.timer) clearTimeout(t.timer);
                
                t.timer = setTimeout(function()
				{
                    if (IsEmail(t.value))
					{
                        $(t).next("span").removeClass('error');
                        $(t).next("span").addClass('success').html(outEmail);
						
                    }
					else
					{
                    	$(t).next("span").removeClass('success');
                        $(t).next("span").addClass('error').html(outEmail);
						
                    };
                }, 200);

                t.lastValue = t.value;
            }
        }

        function IsEmail(email)
		{
            var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-\_])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if((email == null) || (email == "")){
                outEmail = outRequire;
                return false;
            }
            if (regex.test(email))
			{
				outEmail = validateOK;
                return true;
			}
            else
			{
				outEmail = validateFalse;
                return false;
			}
        }

		function Update_Username_Validate_Status(field)
		{

            var t = field;
            if (t.value != t.lastValue)
			{
                if (t.timer) clearTimeout(t.timer);
                $(t).next("span").html(validating);
                t.timer = setTimeout(function()
				{
                    if (IsUser(t.value))
					{
                        $.post("page/validateRegis.jsp",{
                            type : "username",
                            txtUsername: t.value
                        },function(tresultC){

                           var c = parseInt(tresultC);
                           if(c == 0){
                                $(t).next("span").removeClass('error');
                                $(t).next("span").addClass('success').html(outUser);
                           }else{
                                $(t).next("span").removeClass('success');
                                outUser = validateFalse + " : Username นี้มีคนใช้แล้ว";
                                $(t).next("span").addClass('error').html(outUser);
                           }
                        });

                    }
					else
					{
                    	$(t).next("span").removeClass('success');
                        $(t).next("span").addClass('error').html(outUser);
						
                    };
                }, 200);

                t.lastValue = t.value;
            }
        }

         function IsUser(user)
		{
            
            //var regUsername = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-\_])+\.)+([a-zA-Z0-9]{2,4})+$/;
            var userT = user;
            var regUsername = /([a-zA-Z0-9_\-]{4,10})/;
            if((user == null)||(user == "")){
                outUser = outRequire;
                return false;
            }
            if ((regUsername.test(user))&&(userT.length < 11))
			{
				outUser = validateOK;
                return true;
            }
            else{
				outUser = validateFalse;
                return false;
			}

            //เทียบกับในเบสด้วยว่า มีค่าตรงไหม ถ้าซ้ำก็ return false กลับไป
            

        }

        function Update_OPassword_Validate_Status(field)
		{
            var t = field;
            if (t.value != t.lastValue)
			{
                if (t.timer) clearTimeout(t.timer);
                $(t).next("span").html(validating);
                t.timer = setTimeout(function()
				{
                    $.post("page/validateEdit.jsp",{
                            type : "password",
                            txtUsername: $('#txtUsername').val(),
                            txtOPassword: $('#txtOPassword').val()
                        },function(tresultC){
                            var c = parseInt(tresultC);
                            if(c == 1){
                                outUser = validateOK;
                                $(t).next("span").removeClass('error');
                                $(t).next("span").addClass('success').html(outUser);
                            }else{
                                $(t).next("span").removeClass('success');
                                outUser = validateFalse + " : กรุณากรอก Password เก่าให้ถูกต้อง";
                                $(t).next("span").addClass('error').html(outUser);
                            }
                        });
                }, 200);

                t.lastValue = t.value;
            }
        }


        function Update_Password_Validate_Status(field)
		{
            var t = field;
            if (t.value != t.lastValue)
			{
                if (t.timer) clearTimeout(t.timer);
                t.timer = setTimeout(function()
				{
                    if (IsPassword(t.value))
					{
                        $(t).next("span").removeClass('error');
                        $(t).next("span").addClass('success').html(outPass);
						
                    }
					else
					{
                    	$(t).next("span").removeClass('success');
                        $(t).next("span").addClass('error').html(outPass);
						
                    };
                }, 200);

                t.lastValue = t.value;
            }
        }
         function IsPassword(pass)
		{
            var tempUser = $('#txtUsername').val();
            var regPassword = /[a-zA-Z0-9_\-]{8,}/;
            if( (pass == "") || (pass == null) ){
                outPass = outRequire;
                return false;
            }
            if (regPassword.test(pass))
			{
				if(pass == tempUser){
                    outPass = validateFalse + " : It's same Password";
                    return false;
                }
                else{
                    outPass = validateOK;
                    return true;
                }

			}
            else
			{
				outPass = validateFalse + " : อณุญาติเฉพาะ ตัวอักษร ภาษาอังกฤษ และ ตัวเลข [ ขั้นต่ำ 8 ตัวอักษร ]";
                return false;
			}
        }

        function Update_CPassword_Validate_Status(field)
		{
            var t = field;
            if (t.value != t.lastValue)
			{
                if (t.timer) clearTimeout(t.timer);
                t.timer = setTimeout(function()
				{
                    if (IsCPassword(t.value))
					{
                        $(t).next("span").removeClass('error');
                        $(t).next("span").addClass('success').html(outCPass);
					}
					else
					{
                    	$(t).next("span").removeClass('success');
                        $(t).next("span").addClass('error').html(outCPass);
					};
                }, 200);

                t.lastValue = t.value;
            }
        }

         function IsCPassword(cpass)
		{
            var tempPass = $('#txtPassword').val();
            if( (cpass == "") || (cpass == null) ){
                outCPass = outRequire;
                return false;
            }

            if (tempPass == cpass)
			{
			    outCPass = validateOK;
                return true;
            }
            else
			{
				outCPass = validateFalse + " : Please Input same the Password";
                return false;
			}
        }

        function Update_Name_Validate_Status(field)
		{
            var t = field;
            if (t.value != t.lastValue)
			{
                if (t.timer) clearTimeout(t.timer);
                t.timer = setTimeout(function()
				{
                    if (t.value == "")
					{
                        $("#txtSurname").hide();
                        $("#Name_Status_Icon_1").removeClass('success');
                        $("#Name_Status_Icon_1").addClass('error').html(outRequire);
                    }
					else
					{
                    	$("#txtSurname").show();
                        $("#Name_Status_Icon_1").removeClass('error');
                        $("#Name_Status_Icon_1").addClass('success').html(validateOK);
                    };
                }, 200);

                t.lastValue = t.value;
            }
        }

        function Update_Gender_Validate_Status(field)
		{

            var t = field;
            if (t.value != t.lastValue)
			{
                if (t.timer) clearTimeout(t.timer);
                t.timer = setTimeout(function()
				{
                    if (t.value == "- Select One -")
					{
                        $(t).next("span").removeClass('success');
                        $(t).next("span").addClass('error').html(outRequire);
						
                    }
					else
					{
                        $(t).next("span").removeClass('error');
                    	$(t).next("span").addClass('success').html(validateOK);
						
                    };
                }, 200);

                t.lastValue = t.value;

            }

        }
        function Update_Birthday_Validate_Status(field)
		{
            var t = field;
            if (t.value != t.lastValue)
			{
                if (t.timer) clearTimeout(t.timer);
                
                t.timer = setTimeout(function()
				{
                    if (t.value == "")
					{
                        $(t).next("span").removeClass('success');
                        $(t).next("span").addClass('error').html(outRequire);
						
                    }
					else
					{
                    	$(t).next("span").removeClass('error');
                        $(t).next("span").addClass('success').html(validateOK);
						
                    };
                }, 200);

                t.lastValue = t.value;

            }

        }

        function Update_Address_Validate_Status(field)
		{
            var t = field;
            if (t.value != t.lastValue)
			{
                if (t.timer) clearTimeout(t.timer);
               
                t.timer = setTimeout(function()
				{
                    if (t.value == "")
					{
                        $(t).next("span").removeClass('success');
                        $(t).next("span").addClass('error').html(outRequire);
						
                    }
					else
					{
                    	$(t).next("span").removeClass('error');
                        $(t).next("span").addClass('success').html(validateOK);
						
                    };
                }, 200);
                t.lastValue = t.value;
            }
        }

        function Update_Phone_Validate_Status(field)
		{
            var t = field;
            var ar = $('#area_code').val();
            var n1 = $('#number1').val();
            var n2 =$('#number2').val();

            
            if (t.value != t.lastValue)
			{
                if (t.timer) clearTimeout(t.timer);
                
                t.timer = setTimeout(function()
				{
                    if((ar == "")||(n1 == "")||(n2 == "")||(ar.length < 2)||((n1+n2).length < 7))
					{

                        $("#Phone_Status_Icon_1").removeClass('success');
                        if((ar == "")&&(n1 == "")&&(n2 == "")){
                            $("#Phone_Status_Icon_1").addClass('error').html(outRequire);
                        }else{
                            $("#Phone_Status_Icon_1").addClass('error').html(validateFalse + " : Please fill the correct Format");
                        }

						
                    }
					else
					{
                    	$("#Phone_Status_Icon_1").removeClass('error');
                        $("#Phone_Status_Icon_1").addClass('success').html(validateOK);


                    };
                }, 200);
                t.lastValue = t.value;
            }
        }

        function validateAll(){
            var check = 0;
            if(($('#Username_Status_Icon_1').attr("class") == "")||($('#Username_Status_Icon_1').attr("class") == "error")){
                $('#Username_Status_Icon_1').addClass('error').html(outRequire);
                check++;
            }
            if(($('#OPassword_Status_Icon_1').attr("class") == "")||($('#OPassword_Status_Icon_1').attr("class") == "error")){
                $('#OPassword_Status_Icon_1').addClass('error').html(outRequire);
                check++;
            }
            if(($('#Password_Status_Icon_1').attr("class") == "")||($('#Password_Status_Icon_1').attr("class") == "error")){
                $('#Password_Status_Icon_1').addClass('error').html(outRequire);
                check++;
            }
            if(($('#CPassword_Status_Icon_1').attr("class") == "")||($('#CPassword_Status_Icon_1').attr("class") == "error")){
                $('#CPassword_Status_Icon_1').addClass('error').html(outRequire);
                check++;
            }
            if(($('#Email_Address_Status_Icon_1').attr("class") == "")||($('#Email_Address_Status_Icon_1').attr("class") == "error")){
                $('#Email_Address_Status_Icon_1').addClass('error').html(outRequire);
                check++;
            }
            if(($('#Name_Status_Icon_1').attr("class") == "")||($('#Name_Status_Icon_1').attr("class") == "error")){
                $('#txtSurname').hide();
                $('#Name_Status_Icon_1').addClass('error').html(outRequire);
                check++;
            }
            if(($('#Gender_Status_Icon_1').attr("class") == "")||($('#Gender_Status_Icon_1').attr("class") == "error")){
                $('#Gender_Status_Icon_1').addClass('error').html(outRequire);
                check++;
            }
            if(($('#Birthday_Status_Icon_1').attr("class") == "")||($('#Birthday_Status_Icon_1').attr("class") == "error")){
                $('#Birthday_Status_Icon_1').addClass('error').html(outRequire);
                check++;
            }
            if(($('#Address_Status_Icon_1').attr("class") == "")||($('#Address_Status_Icon_1').attr("class") == "error")){
                $('#Address_Status_Icon_1').addClass('error').html(outRequire);
                check++;
            }
            if(($('#Phone_Status_Icon_1').attr("class") == "")||($('#Phone_Status_Icon_1').attr("class") == "error")){
                $('#Phone_Status_Icon_1').addClass('error').html(outRequire);
                check++;
            }
            if(check == 0){
                return true;
            }else{
                return false;
            }
        }

        
        
        



