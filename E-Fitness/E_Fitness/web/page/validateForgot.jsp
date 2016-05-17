<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,java.util.Date"  %>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<jsp:useBean id="mail" scope="session" class="jMail.Mail" />
<jsp:useBean id="generator" scope="session" class="jMail.generateActivateCode" />

<jsp:setProperty name="mail" property="from" value="efitness.mail@gmail.com" />
<jsp:setProperty name="mail" property="smtpServ" value="smtp.gmail.com" />

<%
    request.setCharacterEncoding("utf-8");
    String type = request.getParameter("type");
    
    if(type.equals("username")){
        ArrayList param = new ArrayList();
        String username = request.getParameter("txtUsername");
        param.add(username);
        
        ResultSet rs = myBean.selectData("select * from user where username = ? ",param);
        rs.last();
        out.print(rs.getRow());
        
        
    }else if(type.equals("email")){
        ArrayList param = new ArrayList();
        String username = request.getParameter("txtUsername");
        String email = request.getParameter("txtEmail");
        param.add(username);
        param.add(email);

        ResultSet rs = myBean.selectData("select * from user where username = ? and email = ? ",param);
        rs.last();
        out.print(rs.getRow());

    }else if(type.equals("submit")){
        try{
            String username = new String(request.getParameter("txtUsername").getBytes("utf-8"), "utf-8");
            String email = new String(request.getParameter("txtEmail").getBytes("utf-8"), "utf-8");
            ArrayList param = new ArrayList();
            //สั่งให้ generator gen activate มาให้
            generator.setGenerateCode("user");
            String password = generator.getGenerateCode();
            //
            param.add(password);
            param.add(username);

            int result = myBean.queryData("UPDATE user set password = ? where username = ?",param);

            
            //หลังจากตรงนี้จะทำการส่งเมล์เข้าไปโดยใช้ bean
            // เติม ส่วนของ activate เพิ่มไปในใน msg
            String msg = "This mail is send from e-fitness website";
            msg = msg + "<br />Your Username is <br/>";
            msg = msg + "<b>" + username + "</b>";
            msg = msg + "<br />Your Password if reset to this <br/>";
            msg = msg + "<b>" + password + "</b>";
            msg = msg + " <br /><br />You can change it by the edit button in main page ";
            msg = msg + " <br />Thank you for use our website.";
            
            mail.setTo(email);
            mail.setSubject("Reset Password From E-Fitness");
            mail.setMessage(msg);

            int resultSend;
            resultSend = mail.sendMail(); // ถ้าไม่ error จะได้ออกมาเป็น 0 ใช้ mail.sedMail ส่งได้เลย
            result = result + resultSend;
            
            out.print(result);
            


        }catch(Exception e){
            out.print("0");
        }
    }
    
%>