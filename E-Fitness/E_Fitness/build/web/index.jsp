^<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> E-Fitness :: Partner of your Life </title>
        <!-- jQuery -->
            <link type="text/css" href="css/custom-theme/jquery-ui-1.7.2.custom.css" rel="stylesheet" />
            <script type="text/javascript" src="lib/jquery/jquery.js"></script>
            <script type="text/javascript" src="lib/timepicker/jquery.ui.all.js"></script>
        <!-- ****** -->
        <!-- custom jquery ui framework -->
            <link type="text/css" href="css/fg.menu.css" media="screen" rel="stylesheet" />
            <link type="text/css" href="css/fg-button.css" media="screen" rel="stylesheet" />
        <!-- ******** -->
        <script type="text/javascript" src="lib/pages/index.js"></script>
        <link type="text/css" href="css/index.css" media="screen" rel="stylesheet" />
    </head>
    <body style ="background-color:black">
        <div ID ="all_content" align="center">
            <% 
                if((session.getAttribute("username")!=null && session.getAttribute("username")!="")){
                    response.sendRedirect("home.jsp");
                }
            %>
            <div ID ="header">
                
            </div>
            <div ID ="content" align="center">
                <div ID = "left" class ="ui-state-default" >
                    <div style ="padding:15px">
                        <form action="page/checkLogin.jsp" method ="post">
                            <div class="ui-widget-header ui-corner-all ui-helper-clearfix">
                                <center><a class="header-section">Sign In</a></center>
                            </div>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            E-Fitness Id : <input type ="text" name ="Lusername" id = "loginUsername"  />
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;Password : <input type ="password" name ="Lpassword" id = "loginPassword" />
                            <br />
                            <br />

                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;<input type="checkbox" checked ="checked" name="rememberId" value="memId" />Remember me on this computer
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;<input type="checkbox" name="rememberPass" value="memPass" />Remember my password
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;<input type ="submit" id ="btnSignin" value = "Sign In" class="fg-button ui-state-default ui-corner-all" />
                        </form>
                    </div>
                </div>
                <div ID = "right" class ="ui-state-default" >
                    <div style ="padding:15px">
                        <div class="ui-widget-header ui-corner-all ui-helper-clearfix">
                                <center><a class="header-section">E-Fitness</a></center>
                            </div>
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Powerful trainer for exercise.<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Easy and quick to make exercise schedule. <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Calculate Calory and show the muscle that's effected. <br />

                        &nbsp;&nbsp;Learn more<br />
                        &nbsp;&nbsp;Don't have a E-Fitness ID ?
                        <br />
                        <br />
                        <input type ="button" id ="btnSignup" value = "Sign Up" class="fg-button ui-state-default ui-corner-all" />
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
