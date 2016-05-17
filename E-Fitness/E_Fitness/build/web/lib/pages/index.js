$(document).ready(function(){
    $('.fg-button').hover(
        function(){ $(this).removeClass('ui-state-default').addClass('ui-state-focus'); },
        function(){ $(this).removeClass('ui-state-focus').addClass('ui-state-default'); }
    );
});


