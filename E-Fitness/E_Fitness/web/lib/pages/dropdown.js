var body = {};
var currentHightlight = null;
// obj (static) for keep value when working in loop


var userid = null;
$(document).ready(function(){
    // check user id  of session
    $.post("page/check_userid.jsp", function(data){       
        userid = $.trim(data.toString());
    });

    // use Raphael for create SVG model
    var R = Raphael("paper", 490,570);
	body = R.body();

    $('#hierarchybreadcrumb').menu({
        content: $('#hierarchybreadcrumb').next().html(),
        backLink: false
    });

    /* event
    $("#addUserJob").click(function(){
        // alert(document.getElementsByName("selectJobs")[0].parentNode.id);
        var jobs = document.getElementsByName("selectJobs"); // รับค่าจาก hidden field เพราะ ie ไม่ยอมให้ div มี name
        var j = 0;
        for(var i=0;i<jobs.length;i++)
        {
            var jobid = "#" + document.getElementsByName("selectJobs")[i].parentNode.id;
            var job = document.getElementsByName("selectJobs")[i].parentNode; // อ้างถึง div นอกสุด
            if($(jobid).css("display") != "none") // เช็คว่า job ใดที่ไม่ได้ถูกซ่อนจะให้ add ลง db ได้
            {
                if($(jobid + " .datepicker").val() != "")
                {
                    c.jobs[j] = $(jobid + " .job").html();
                    c.date[j] = $(jobid + " .datepicker").val() + " 00:00:00";
                    alert($(jobid + " .txtCalories").val());
                    c.calories[j] = $(jobid + " .txtCalories").val();
                    j++;
                }
                else // ถ้าไม่ใส่ date จะแสดง error
                {
                    $(jobid + " .datepicker").addClass("error");
                }
                //alert(c.jobs[i] + " | " + c.date[i] );
            }
            // job ที่ไม่ error เมื่อ add ลง db แล้ว จะหายไป
            if($(jobid + " .datepicker").css("background-color") != "rgb(255, 0, 0)" && $(jobid + " .datepicker").css("background-color") != "red")
            {
                removeJobs(jobid);
            }
        }
        $.post("page/query/insertuserjob.jsp", {
            userid:userid,
            jobs:c.jobs,
            date:c.date,
            calories:c.calories
        },function(){
            c.jobs = new Array(); // clear array
            c.calories = new Array();
        });
    });
*/
});

function clickDropdown(item)
{
    if(c.count != 0)
    {
       $("#task-detail").append(
        "<div class=\"task\" id=\"jobs"+item.attr("id")+"_"+c.count+"\">"+
        "<div>Task : <span>"+item.attr("type")+" "+item.attr("task") + "</span></div>"+
        "<div>"+
            "Date : "+
            "<input type=\"text\" class=\"datepicker\" name=\"datepicker\" size=\"12\" />" +
        "</div>"+
        "<div>"+
            "Time : "+
            "<input type=\"text\" class=\"timepicker\" name=\"timepicker\" />" +
        "</div>"+
        "<a id=\"#jobs"+item.attr("id")+"_"+c.count+"\" class=\"task-command\" cmd=\"add\" ><img src=\"images/icon-ok.gif\" /></a>&nbsp;" +
        "<a id=\"#jobs"+item.attr("id")+"_"+c.count+"\" class=\"task-command\" cmd=\"delete\"><img src=\"images/icon-false.gif\" /></a>" +
        "</div>");
    }
    else
    {
        //first task
        $("#task-detail").html(
        "<div class=\"task\" id=\"jobs"+item.attr("id")+"_"+c.count+"\">"+
        "<div>Task : <span>"+item.attr("type")+" "+item.attr("task") + "</span></div>"+
        "<div>"+
            "Date : "+
            "<input type=\"text\" class=\"datepicker\" name=\"datepicker\" size=\"12\" />" +
        "</div>"+
        "<div>"+
            "Time : "+
            "<input type=\"text\" class=\"timepicker\" name=\"timepicker\" />" +
        "</div>"+
        "<a id=\"#jobs"+item.attr("id")+"_"+c.count+"\" class=\"task-command\" cmd=\"add\"><img src=\"images/icon-ok.gif\" /></a>&nbsp;" +
        "<a id=\"#jobs"+item.attr("id")+"_"+c.count+"\" class=\"task-command\" cmd=\"delete\"><img src=\"images/icon-false.gif\" /></a>" +
        "</div>");
    }
    c.count++; // count task schedule
}

//work  do not edit this method
function hoverDropdown(item)
{
     //hoverDropdown callback here
     //code below for highlight SVG model
     if(item.attr("hilight") != null)
     {
         if(currentHightlight != null)
         {
             for(var i=0;i<currentHightlight.length;i++)
             {
                 body[currentHightlight[i]].animate({fill: "white", stroke: "none"}, 200);
             }
         }

         var hilightSet = item.attr("hilight").split("-");

         for(var i=0;i<hilightSet.length;i++)
         {
             body[hilightSet[i]].animate({fill:"orange", stroke:"none"}, 200);
         }
         currentHightlight = hilightSet;
     }
}

// เมื่อใส่วันที่แล้วจะหาย error
function removeError(jobid)
{
    if($("#" + jobid + " .datepicker").val() == "")
    {
        $("#" + jobid + " .datepicker").addClass("error");
    }
    else
    {
        $("#" + jobid + " .datepicker").removeClass("error");
    }
}