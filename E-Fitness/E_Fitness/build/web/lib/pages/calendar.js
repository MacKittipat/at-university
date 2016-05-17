$(document).ready(function(){
    scheduler.config.xml_date="%Y-%m-%d %H:%i";
    scheduler.config.lightbox.sections=[
        {name:"description", height:40, map_to:"text", type:"textarea" , focus:true},
        {name:"location", height:80, type:"textarea", map_to:"details" },
        {name:"calories", height:80, type:"textarea", map_to:"calories" }, //เพิ่ม textarea ชื่อ test
        {name:"time", height:72, type:"time", map_to:"auto"}
    ]
    scheduler.config.first_hour=0; // เริ่มที่ 0.00 น.
    scheduler.locale.labels.section_location="Location";
    scheduler.locale.labels.section_calories="Calories"; // ใช้ section_test เพราะ name คือ test
    scheduler.config.details_on_create=true;
    scheduler.config.details_on_dblclick=true;
    scheduler.init('scheduler_here',null,"week"); // start tab ที่ week
    scheduler.load("page/query/selectdata.jsp?t=" + new Date().getTime()); // แก้ cache ie ด้วย Date ตอน select
    var dp = new dataProcessor("page/query/selectdata.jsp");
    dp.init(scheduler);

    var convert = scheduler.date.date_to_str("%Y-%m-%d %H:%i"); // function format date

    // insert
    scheduler.attachEvent("onEventAdded", function(event_id,event_object){
        if(scheduler._loading == false) // ถ้าไม่ใช่การ load page ครั้งแรกจะ insert ได้
        {
            var details = "";
            if(event_object.details) // เอาไว้ป้องกันค่า event_object.details เป็น undefine เมื่อ insert ครั้งแรกโดยไม่ได้ใส่ details แต่จะให้เป็นสตริงว่างแทน
            {
                details = event_object.details;
            }
            else
            {
                details = ""; // ถ้า insert ครั้งแรกแล้วไม่มีการใส่ details จะให้เก็บ string ว่างแทน undefine
            }
            var calories ="";
            if(event_object.calories) 
            {
                calories = event_object.calories;
            }
            else
            {
                calories = ""; 
            }
            $.post("page/query/insertdata.jsp", {
                id:event_id, // เมื่อสร้าง event ครั้งแรกจะมีการสร้าง auto_id ให้
                start_date:convert(event_object.start_date),
                end_date:convert(event_object.end_date),
                text:event_object.text,
                details:details,
                calories:calories
            });
        }
    });

    // update
    scheduler.attachEvent("onEventChanged", function(event_id,event_object){
        $.post("page/query/updatedata.jsp", {
            id:event_id,
            start_date:convert(event_object.start_date),
            end_date:convert(event_object.end_date),
            text:event_object.text,
            details:event_object.details,
            calories:event_object.calories
        });
    });

    // delete
    scheduler.attachEvent("onBeforeEventDelete", function(event_id,event_object){
        $.post("page/query/deletedata.jsp", {
            id:event_id,
            start_date:convert(event_object.start_date),
            end_date:convert(event_object.end_date),
            text:event_object.text,
            details:event_object.details
        });
    });
});


