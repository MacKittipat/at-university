var borderColor = "";
var captchaDir = "/E_Fitness/lib/captcha";
var url = captchaDir + "/captcha.jsp";
var formId = "myForm";
var items = Array("pencil", "scissors", "clock", "heart", "note");

$(document).ready(function(){
    $(".ajax-fc-container").captcha();
});

