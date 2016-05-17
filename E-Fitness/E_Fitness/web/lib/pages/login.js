$(document).ready(function(){
    $("#btnLogin").livequery('click', function(){
        if($.trim($("#txtUsernameLogin").val()) == "")
        {
            $("#txtUsernameLogin").addClass("require");
            //$("#txtUsernameLogin").val("Please check username & password");
        }
        else
        {
            $("#txtUsernameLogin").removeClass("require");
        }
        
        if($.trim($("#txtPasswordLogin").val()) == "")
        {
            $("#txtPasswordLogin").addClass("require");
            $("#txtPasswordLogin").val("");
        }
        else
        {
            $("#txtPasswordLogin").removeClass("require");
        }
        
        if(!($("#txtUsernameLogin").hasClass("require") || $("#txtPasswordLogin").hasClass("require")))
        {
            $("#divLogin").fadeOut("fast");
            $("#divLogin").hide();
            $("#login-loading").fadeIn("fast");
            $.post("page/query/login.jsp", {
                username:$("#txtUsernameLogin").val(),
                password:$("#txtPasswordLogin").val()
            },function(data){
                if($.trim(data.toString()) == "true")
                {
                    $("#divLogin").load("page/component/login.jsp");
                    $("#login-loading").fadeOut("fast");
                    $("#login-loading").hide();
                    $("#divLogin").fadeIn("fast");
                }
                else
                {
                    $("#login-loading").fadeOut("fast");
                    $("#login-loading").hide();
                    $("#divLogin").fadeIn("fast");
                    $("#login-failed").fadeIn("fast");
                    $("#txtPasswordLogin").val("");
                }
            });
        }
    });

    $("#btnLogout").livequery('click', function(){
        $("#divLogin").fadeOut("fast");
        $("#divLogin").hide();
        $("#login-loading").fadeIn("fast");
        $.post("page/query/logout.jsp",function(){
            $("#divLogin").load("page/component/login.jsp");
            $("#login-loading").fadeOut("fast");
            $("#login-loading").hide();
            $("#divLogin").fadeIn("fast");
        });
    });

    $("#forgor-password").livequery('click', function(){
        // do not forget change url to forgot password page
        $("#content-wrap").load("forgot_password.jsp");
        $('#dropdown-absolute').remove();
        $("#header-content").text("Forgot Password");
    });

    $("#btnSignup").livequery('click', function(){
        $("#content-wrap").load("regis.jsp");
        $('#dropdown-absolute').remove();
        $("#header-content").text("Sign Up");
    });

    $("#btnEditProfile").livequery('click', function(){
        // do not forget change url to edit profile page
        $("#content-wrap").load("edit_profile.jsp");
        $('#dropdown-absolute').remove();
        $("#header-content").text("Edit Profile");
    });
});