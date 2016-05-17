<%-- 
    Document   : index
    Created on : 27 ส.ค. 2552, 12:30:13
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Doctor Appoint System</title>
        <link rel="shortcut icon" href="images/clock.ico" />
        <!---StyleSheet--->
        <link rel="stylesheet" href="script/style.css" />
        <!--[StyleSheet]-->
        <!---jQuery--->
        <script type="text/javascript" src="script/lib/jquery/jquery.js"></script>
        <!--[jQuery]-->
        <!---jQuery-LiveQuery--->
        <script type="text/javascript" src="script/lib/jquery/jquery-livequery.js"></script>
        <!--[jQuery-LiveQuery]-->
        <!---Script Login--->
        <script type="text/javascript" src="script/component/login.js"></script>
        <!--[Script Login]-->
    </head>
    <body>
    	<!---Header--->
        <div class="header">
            <div class="logo">
                <%@include file="component/logo.jspf" %>
            </div>
            <div class="bg-header">
                <%@include file="component/bg-header.jspf" %>
            </div>
    	</div>
        <!--[Header]-->
        <br />
        <!---Content--->
        <div class="content">
            <!---LeftContent--->
            <div class="l-content">
                <!---Navigate--->
                <div class="navigate">
                    <jsp:include page="component/navigate.jsp"></jsp:include>
                </div>
                <!--[Navigate]-->  
                <br />
                <!---Login--->
                <div class="login">
                    <jsp:include page="component/login.jsp"></jsp:include>
                </div>
                <!--[Login]-->
            </div>
            <!--[LeftContent]-->
            <!---RightContent--->
            <div class="r-content">
                <h2>
                    Home
                </h2>
                <div class="p-content">
                    <div style="overflow:auto;">
                        <div style="float:left;margin-right:30px;">
                            <img src="images/health.jpg" />
                        </div>
                        <div style="float:left;margin-right:30px;">
                            <img src="images/time.jpg" />
                        </div>
                        <div style="float:left;margin-right:30px;">
                            <img src="images/doctor.jpg" />
                        </div>
                    </div>
                    <br />
                    <div>
                        Save your health, save your time with Doctor Appointment System.
                    </div>
                    <div>
                        <ul>
                            <li>
                                View doctor's information.
                            </li>
                            <li>
                                Make appointment at date and time that you want.
                            </li>
                            <li>
                                Manage appointment by yourself.
                            </li>
                            <li>
                                Print appointment paper at home.
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--[RightContent]-->
        </div>
        <!--[Content]-->
        <br />
        <!---Footer--->
        <div class="footer">
            <jsp:include page="component/footer.jsp"></jsp:include>
        </div>
        <!--[Footer]-->
    </body>
</html>
