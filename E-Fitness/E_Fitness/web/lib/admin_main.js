$(document).ready(function(){
    $("#btnIndex").click(function(){
        window.location="index.jsp";
    });
    
    $("#btnEdituser").click(function(){
        $("#reportAdmin").hide();
        $("#gridUser").show();
    });
    $("#btnReport").click(function(){
        $("#gridUser").hide();
        $("#reportAdmin").show();
    });

    $('.fg-button').livequery(function(){
        $(this).hover(
            function(){ $(this).removeClass('ui-state-default').addClass('ui-state-focus'); },
            function(){ $(this).removeClass('ui-state-focus').addClass('ui-state-default'); }
        );
    });


});


