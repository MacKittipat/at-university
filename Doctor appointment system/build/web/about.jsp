<%-- 
    Document   : about
    Created on : 7 ก.ย. 2552, 19:10:11
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
                    About
                </h2>
                <div class="p-content">
                    <div>
                        Doctor Appointment System is application program that used by patient to make appointment with doctor, appointment management and checking for appointment times. It's easier and faster.
                    </div>
                    <br />
                    <div>
                        <div style="font-weight:bolder;">
                            Developer : 
                        </div>
                        <ul style="list-style-image:url('images/developer.png')">
                            <li>
                                50215702 , Kittipat Matachoochok
                            </li>
                            <li>
                                50215707 , Shumnan Suenkchitsiriroj
                            </li>
                            <li>
                                50215708 , Thitiporn Marangsee
                            </li>
                        </ul>
                        <a href="http://science.kmutt.ac.th/mth/" target="_blank">Department of Math.</a> , <a href="http://www2.kmutt.ac.th/" target="_blank">KMUTT</a>
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
