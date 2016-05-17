$(function(){

    $("#header a").hover(
        function(){
            $(this).addClass("ui-state-hover");
        },
        function(){
            $(this).removeClass("ui-state-hover");
        }
      );
    
    // BUTTONS  use livequery for update dom when add element
    $('.fg-button').livequery(function(){
        $(this).hover(
            function(){ $(this).removeClass('ui-state-default').addClass('ui-state-focus'); },
            function(){ $(this).removeClass('ui-state-focus').addClass('ui-state-default'); }
        );
    });

    $("#menu-bar-calendar").click(function(){
        $("#content-wrap").load("calendar.jsp");
        $('#dropdown-absolute').remove();
        $("#header-content").text("Task Schedule");
    });

    $("#menu-bar-contact-us").click(function(){
        $("#content-wrap").load("contact_us.jsp");
        $('#dropdown-absolute').remove();
        $("#header-content").text("Contact E-Fitness");
    });

    $("#menu-bar-home").click(function(){
        $("#content-wrap").load("dropdown.jsp");
        $('#dropdown-absolute').remove();
        $("#header-content").text("Choose Your Task");
    });

    $("#menu-bar-live-talk").click(function(){
        $("#content-wrap").load("chatroom.jsp");
        $('#dropdown-absolute').remove();
        $("#header-content").text("E-Fitness Live Talk");
    });
    
});