<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login to E-Fitness partner of your health</title>
        <script type="text/javascript" src="lib/pages/login.js"></script>
        <link type="text/css" href="css/login.css" rel="stylesheet" />
    </head>
    <body>
    <div id="divLogin" class="ui-state-default">
        <div class="ui-widget-header ui-corner-all ui-helper-clearfix">
            <center><a class="header-section">Login</a></center>
        </div>
        <fieldset>
        <%
            if(session.getAttribute("username")==null || session.getAttribute("username")=="") // if no session that mean no user login
            {
        %>
            <form action="#Login">
                    <label for="txtUsernameLogin">Username :</label>
                    <input id="txtUsernameLogin" tabindex="1" type="text" />
                    <label for="txtPasswordLogin">Password :</label> <a id="forgor-password">(forgot?)</a>
                    <input id="txtPasswordLogin" tabindex="2" type="password" />
                    <div id="login-failed">Log In Failed.</div>
                    <div>
                        <input id="remember_me" tabindex="3" type="checkbox" value="1">
                        <label for="remember_me">Remember me</label>
                    </div>
                    <input id="btnLogin" type="button" class="fg-button ui-state-default ui-corner-all" value="Log In" />
                    <input id="btnSignup" type="button" class="fg-button ui-state-default ui-corner-all" value="Sign Up" />
            </form>
        <%
            }
            else
            {
        %>
            <form action="#Logout">
                    <div>
                        <label>Welcome : <%= session.getAttribute("username") %></label>
                    </div>
                    <input id="btnLogout" type="button" class="fg-button ui-state-default ui-corner-all" value="Log Out" />
                    <input id="btnEditProfile" type="button" class="fg-button ui-state-default ui-corner-all" value="Profile" />
            </form>
        <%
            }
        %>
        </fieldset>
    </div>
    <div id="login-loading"><fieldset id="fs-loading"></fieldset></div>
    </body>
</html>
