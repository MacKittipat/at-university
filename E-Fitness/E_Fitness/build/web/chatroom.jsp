<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Chatroom -->
            <link rel="stylesheet" href="css/chatroom/chatroom.css"/>
            <script type="text/javascript" src="lib/chatroom/chatroom.js"></script>
            <script type="text/javascript" src="lib/chatroom/date_format.js"></script>
        <!-- ******** -->
        <title>E-Fitness Live Talk</title>
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
                out.print("<input type='hidden' id='hidUsername' value='" + username + "'>");
                out.print("<input type='hidden' id='hidUserId' value='" + userId + "'>");
                if(username == null || username=="")
                {
            %>    
                     <jsp:forward page="index.jsp"/>
            <%                 
                }
            %>            
        <div id="wrap-live-talk">
            <div id="message" class="ui-state-default">
                    
            </div>
            <div id="inputMessage">
                <textarea id="txtMessage"></textarea>
                <input type="button" value="Send" id="btnSubmit" class="fg-button ui-state-default ui-corner-all" />
            </div>
        </div>
    </body>
</html>
