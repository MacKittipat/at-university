<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Captcha</title>
        <!-- Captcha -->
        <link href="lib/captcha/captcha.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="lib/captcha/jquery.captcha.js"></script>
        <script type="text/javascript" charset="utf-8">
                var borderColor = "";
                var captchaDir = "/E_Fitness/lib/captcha";
                var url = captchaDir + "/captcha.jsp";
                var formId = "myForm";
                var items = Array("pencil", "scissors", "clock", "heart", "note");
                $(document).ready(function(){
                    $(".ajax-fc-container").captcha();
                });
        </script>
        <!-- ******* -->
    </head>
    <body>
        <div class="ajax-fc-container"></div>
    </body>
</html>
