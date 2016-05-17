<%-- 
    Document   : sendMail.jsp
    Created on : 25 มิ.ย. 2552, 22:50:06
    Author     : Ponlavat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    <% 
        request.setCharacterEncoding("utf-8");
    %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:useBean id="mail" scope="session" class="jMail.Mail" />
        <jsp:setProperty name="mail" property="to" param="to" />

        <jsp:setProperty name="mail" property="from" value="efitness.mail@gmail.com" />
        <jsp:setProperty name="mail" property="smtpServ" value="smtp.gmail.com" />

        <jsp:setProperty name="mail" property="subject" param="subject" />
        <jsp:setProperty name="mail" property="message" param="message" />

    </head>
    <body>
         <%
            String to = mail.getTo(); // ดึงค่าออกมาว่าจะส่งหาใคร
            int result;
            result = mail.sendMail(); // ถ้าไม่ error จะได้ออกมาเป็น 0 ใช้ mail.sedMail ส่งได้เลย
            if(result == 0){
                out.println(" Mail Successfully Sent to "+to);
            }
            else{
                out.println(" Mail NOT Sent to "+to);
            }
        %>

    </body>
</html>
