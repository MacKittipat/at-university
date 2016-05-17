/**
 * @author Kittipat_Mac
 */
$(document).ready(function(){
    $(".login form").livequery(function(){ //livequery เพื่อให้ login ได้หลังจากกด logout เพื่อ load login.jsp ใหม่
        $(".login form").submit(function(){ //กดปุ่ม Login หรือ Enter
            var username = $("#txtUsernameLogin").val();
            var password = $("#txtPasswordLogin").val();
            $(".login").html("<img src='images/loading2.gif' alt='loading' />");
            $.post("query/logins.jsp", { //แสดงข้อมูล patient
                username:username,
                password:password
            },function(data){
                if($.trim(data)!=""){ //login ได้
                    $(".login").html(data);
                }else{ //ถ้า login ไม่ผ่านจะให้แสดง form login ใหม่
                    $(".login").load("component/login.jsp");
                }

            });
        });
    });
    $("#btnLogout").livequery(function(){ //กดปุ่ม Logout จะแสดง form login ใหม่
        $("#btnLogout").click(function(){
            $(".login").html("<img src='images/loading2.gif' alt='loading' />");
            $.post("query/logouts.jsp", function(){ //ไป logout.jsp เพื่อ clear session
                $(".login").load("component/login.jsp");
            });
        });
    });
});

