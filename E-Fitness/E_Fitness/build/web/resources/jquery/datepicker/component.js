/* 
Copyright 2007 You may not modify, use, reproduce, or distribute this software 
except in compliance with the terms of the License at:
http://developer.sun.com/berkeley_license.html
*/
jmaki.namespace("jmaki.widgets.jquery.datepicker");

/**
* jQuery UI Date Picker jMaki Wrapper Widget
*
* @author Ahmad M. Zawawi <ahmad.zawawi@gmail.com>
* @constructor
* @see http://docs.jquery.com/UI/Datepicker
*/
jmaki.widgets.jquery.datepicker.Widget = function(wargs) {
    var _widget = this;
    var uuid = wargs.uuid;
    var publish = "/jquery/datepicker";
    var subscribe = ["/jquery/datepicker", "/datepicker"];
    
    if ( wargs.publish) {
        publish = wargs.publish;
    }

    this.postLoad = function() {
        $('#' + uuid).datepicker();
    }
};
