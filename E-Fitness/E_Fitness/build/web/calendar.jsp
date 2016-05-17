<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendar</title>
            <link rel="stylesheet" type="text/css" href="lib/dhtmlxscheduler/dhtmlxscheduler.css"/>
            <script type="text/javascript" src="lib/dhtmlxscheduler/dhtmlxscheduler.js"></script>
            <script type="text/javascript" src="lib/pages/calendar.js"></script>
        <!-- ******** -->
    </head>
    <body>
            <%
                //รับชื่อ username
                String username ="";
                String userId = "";
                try
                {
                    username = session.getAttribute("username").toString();
                    userId = session.getAttribute("userId").toString();
                }
                catch(Exception e)
                {}
                if(username == null || username=="")
                {
            %>
                     
            <%
                }
            %>     
        <div id="scheduler_here" class="dhx_cal_container" style='width:740px; height:450px;'>
            <div class="dhx_cal_navline">
                <div class="dhx_cal_prev_button">&nbsp;</div>
                <div class="dhx_cal_next_button">&nbsp;</div>
                <div class="dhx_cal_today_button"></div>
                <div class="dhx_cal_date"></div>
                <div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
                <div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
                <div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
            </div>
            <div class="dhx_cal_header">
            </div>
            <div class="dhx_cal_data">
            </div>
        </div>
        
    </body>
</html>
