$(document).ready(function(){
    // ตอนโหลดเพจครั้งแรกให้ insert user login เข้า table login เพื่อเอาไว้แสดงว่ามีใครบ้างที่ใช้ chatroom
    insertUserLogin();
    // ตอนโหลดเพจครั้งแรกให้ select message มาแสดง
    selectMessage();
    // โชว์รายชื่อ user ที่ใช้ chatroom
    showUserLogin();
    // คลิก btnSubmit ส่ง message
    $("#btnSubmit").click(function(){
        var userid = $("#hidUserId").val();
        var message = $("#txtMessage").val();
        var datetime = new Date().format("yyyy-mm-dd HH:MM:ss");
        // insert ลง db
        insertMessage(userid,message,datetime);
        // clear ค่าใน text
        clearInput();
        // select message มาใหม่
        selectMessage();
    });
    // click logout จะลบ user ออกจาก table logout เพื่อป้องกันไม่ให้มีชื่อ user ใน #user ซ้ำกัน
    $("#linkLogout").click(function(){
        deleteUserLogin();
    });

    $("#txtMessage").livequery(function(){
       $(this).resizable({
			maxWidth: 600,
			minHeight: 30,
			minWidth: 30,
            animate: true,
            ghost:true
        });
    });
});

function selectMessage()
{
    $.post("page/chatroom/select_message.jsp",{},function(data){
        $("#message").html(data);
    });
    // refresh ทุก 3 seconds
    setTimeout("selectMessage();", 3000); 
}

function insertMessage(userid,message,datetime)
{
        $.post("page/chatroom/insert_message.jsp", {
            userid:userid,
            message:message,
            datetime:datetime
        });    
}

// insert ชื่อ user_id ที่ login เข้ามา chatroom
function insertUserLogin()
{
    $.post("page/chatroom/insert_user_login.jsp",{
        userid:$("#hidUserId").val()
    });
}

// delete user ที่ logout คือคนที่ออกจาก chatroom
function deleteUserLogin()
{
    $.post("page/chatroom/delete_user_login.jsp", {
        userid:$("#hidUserId").val()
    });
}

function showUserLogin()
{
    $.post("page/chatroom/select_user_login.jsp",function(data){
            $("#user").html(data);
    });
    setTimeout("showUserLogin();", 3000);
}

function clearInput()
{
    $("#txtMessage").val("");
}