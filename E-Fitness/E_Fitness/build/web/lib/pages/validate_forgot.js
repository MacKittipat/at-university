
        var validateOK = '<img src="images/icon-ok.gif" height="16" width="16" />';
        var validating = '<img src="images/ajax-loader-spin.gif" height="16" width="16" />';
        var outRequire = '<img src="images/icon-require.gif" height="14" width="210" />';
        var validateFalse = '<img src="images/icon-false.gif" height="16" width="16" />';

        var outUser = "This field cann't be NULL";
        var outEmail = "This field cann't be NULL";
        $(document).ready(function()
		{

            $('#txtUsername').keyup(function(){Update_Username_Validate_Status(this)});
            $('#txtEmail').keyup(function(){Update_Email_Validate_Status(this)});
            $("#btnSubmit").click(function(){
                if(validateAll()){
                    $("#forgotForm").fadeOut("fast");
                    $("#forgotWait").fadeIn(500);
                    $("#loading").html(validating);
                    $.post("page/validateForgot.jsp",{
                        type : "submit",
                        txtUsername: $('#txtUsername').val(),
                        txtEmail:  $('#txtEmail').val()
                     },function(tresultC){
                        var resultC = parseInt(tresultC);
                        //alert(resultC);
                        if(resultC == 1){
                            $("#forgotWait").fadeOut(500);
                            $("#forgotSuccess").fadeIn(500);
                        }else{
                            $("#forgotWait").fadeOut(500);
                            $("#forgotError").fadeIn(500);
                        }
                     });
            }
        });
            $("#btnSuccess").click(function(){
                window.location = "http://localhost:8080/E_Fitness/";
            });
            
        });

        

        function Update_Username_Validate_Status(field)
		{
            var t = field;
            if (t.value != t.lastValue)
			{
                if (t.timer) clearTimeout(t.timer);
                $(t).next("span").html(validating);
                t.timer = setTimeout(function()
				{
                    $.post("page/validateForgot.jsp",{
                            type : "username",
                            txtUsername: $('#txtUsername').val()
                            
                        },function(tresultC){
                            var c = parseInt(tresultC);
                            if(c == 1){
                                outUser = validateOK;
                                $(t).next("span").removeClass('error');
                                $(t).next("span").addClass('success').html(outUser);
                            }else{
                                $(t).next("span").removeClass('success');
                                outUser = validateFalse + " ไม่มี Username นี้ในระบบ";
                                $(t).next("span").addClass('error').html(outUser);
                            }
                        });
                }, 200);

                t.lastValue = t.value;
            }
        }

        function Update_Email_Validate_Status(field)
		{
            var t = field;
            if (t.value != t.lastValue)
			{
                if (t.timer) clearTimeout(t.timer);

                t.timer = setTimeout(function()
				{
                    $.post("page/validateForgot.jsp",{
                            type : "email",
                            txtUsername: $('#txtUsername').val(),
                            txtEmail: $('#txtEmail').val()
                        },function(tresultC){
                            var c = parseInt(tresultC);
                            if(c == 1){
                                outUser = validateOK;
                                $(t).next("span").removeClass('error');
                                $(t).next("span").addClass('success').html(outUser);
                            }else{
                                $(t).next("span").removeClass('success');
                                outUser = validateFalse + " Email ผิดพลาด";
                                $(t).next("span").addClass('error').html(outUser);
                            }
                        });
                }, 200);


                t.lastValue = t.value;
            }
        }
        

        

        function validateAll(){
            var check = 0;
            if(($('#userCheck').attr("class") == "")||($('#userCheck').attr("class") == "error")){
                $('#userCheck').addClass('error').html(outRequire);
                check++;
            }
            if(($('#emailCheck').attr("class") == "")||($('#emailCheck').attr("class") == "error")){
                $('#emailCheck').addClass('error').html(outRequire);
                check++;
            }
            
            if(check == 0){
                return true;
            }else{
                return false;
            }
        }

        
        
        



