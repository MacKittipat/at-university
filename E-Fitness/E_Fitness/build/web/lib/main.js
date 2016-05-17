//variable for count job select must be static 
var c = {
    count:0,
    jobs:[],
    date:[],
    calories:[]
};

$(document).ready(function(){
    //resizeable for task-detail-wrap
    $("#task-detail-wrap").resizable({
			maxWidth: 190,
			minHeight: 180,
			minWidth: 190,
            animate: true,
            ghost:true
    });

// Add or Remove each job  from dynamic add from dropdown
    $("#task-detail div a").livequery('click', function(){
        if($(this).attr("cmd") == "add")
        {
            //alert($($(this).attr("id")+" div span").html());
            //alert($($(this).attr("id")+" div .datepicker").val());
            //alert($($(this).attr("id")+" div .timepicker").val());
            if(validate_task($(this).attr("id")))
            {
                //do not forget input function for add task
             $.post("page/query/insertuserjob.jsp", {
                        userid:userid,
                        jobs:$($(this).attr("id")+" div span").html(),
                        date:$($(this).attr("id")+" div .datepicker").val(),
                        time:$($(this).attr("id")+" div .timepicker").val()
                    },function(){
                        //c.jobs = new Array(); // clear array
                    });
                remove_from_list($(this).attr("id"));
            }
        }
        else
        {
            alert("delete");
            remove_from_list($(this).attr("id"));
        }
    });

    function remove_from_list(div_id)
    {
        $(div_id).fadeOut("slow",function(){
            $(this).remove();
            c.count--;
            if(c.count == 0)
            {
                $("#task-detail").html("No Task");
            }
        });
    }

    function validate_task(div_id)
    {
        var ok = true;
        $(div_id+" div input").each(function(){
            if($.trim($(this).val()) == "")
            {
                $(this).addClass("require");
                ok = false;
            }
            else
            {
                $(this).removeClass("require");
            }
        })
        return ok;
    }

    $(".datepicker").livequery(function(){
         $(this).datepicker({
            dateFormat: 'yy-mm-dd',
            minDate: new Date()
            //onClose:removeError($(this).parents("div").attr("id"))
        });
    });

    //set timepicker
    $(".timepicker").livequery(function(){
        $(this).timepickr();
        // temporary fix..
        $('.ui-dropslide ol:eq(0) li:first').mouseover();
    });
    
});


