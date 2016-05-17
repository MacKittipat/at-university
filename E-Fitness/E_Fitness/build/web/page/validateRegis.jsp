<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*,java.util.*,java.util.Date"  %>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<jsp:useBean id="mail" scope="session" class="jMail.Mail" />
<jsp:useBean id="generator" scope="session" class="jMail.generateActivateCode" />
<jsp:setProperty name="mail" property="from" value="efitness.mail@gmail.com" />
<jsp:setProperty name="mail" property="smtpServ" value="smtp.gmail.com" />

<%
    request.setCharacterEncoding("utf-8");

    String type = request.getParameter("type");
    //String type = "submit";
    if(type.equals("username")){
        ArrayList param = new ArrayList();
        String username = request.getParameter("txtUsername");
        param.add(username);
        ResultSet rs = myBean.selectData("select * from user where username = ? ",param);
        rs.last();
        out.print(rs.getRow());
        
        
    }else if(type.equals("submit")){
        
        try{
            String username = new String(request.getParameter("username").getBytes("utf-8"), "utf-8");
            String password = new String(request.getParameter("password").getBytes("utf-8"), "utf-8");
            String email = new String(request.getParameter("email").getBytes("utf-8"), "utf-8");
            String name = new String(request.getParameter("name").getBytes("utf-8"), "utf-8");
            String surname = new String(request.getParameter("surname").getBytes("utf-8"), "utf-8");
            String gender = new String(request.getParameter("gender").getBytes("utf-8"), "utf-8");
            String birthday = new String(request.getParameter("birthday").getBytes("utf-8"), "utf-8");
            String address = new String(request.getParameter("address").getBytes("utf-8"), "utf-8");
            String phone = new String(request.getParameter("phone").getBytes("utf-8"), "utf-8");
            String receive = new String(request.getParameter("receive").getBytes("utf-8"), "utf-8");


            Date objDate = new Date();
            String today = (objDate.getYear()+1900) + "-" + (objDate.getMonth()+1) + "-" + objDate.getDate();
            today = today + " " + objDate.getHours() + ":" + objDate.getMinutes() + ":" + objDate.getSeconds();
            ArrayList param = new ArrayList();
            //สั่งให้ generator gen activate มาให้
            generator.setGenerateCode(username);
            String activateCode = generator.getGenerateCode();
            //
            param.add(username);
            param.add(password);
            param.add(email);
            param.add(name);
            param.add(surname);
            param.add(gender);
            param.add(birthday);
            param.add(address);
            param.add(phone);
            param.add(receive);
            param.add(today);
            param.add(activateCode);
            int result = myBean.queryData("INSERT INTO user(username,password,email,name,surname,gender,birthday,address,phone,receiveNews,create_date,activate_code) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)",param);

            //หลังจากตรงนี้จะทำการส่งเมล์เข้าไปโดยใช้ bean
            // เติม ส่วนของ activate เพิ่มไปในใน msg
            String urlVerify = "http://localhost:8080/E_Fitness/verify.jsp?activateCode=";
            String msg = "Thank you for Register in My Website.";
            msg =  msg + " <br />You can complete registration by clicking the following link ";
            msg = msg + " <a href=\"" + urlVerify + activateCode + "&username=" + username + "\">";
            msg = msg + urlVerify + activateCode + "&username=" + username + "</a> ";

            mail.setTo(email);
            mail.setSubject("Activation Mail From E-Fitness");
            mail.setMessage(msg);

            String to = mail.getTo(); // ดึงค่าออกมาว่าจะส่งหาใคร
            int resultSend;
            resultSend = mail.sendMail(); // ถ้าไม่ error จะได้ออกมาเป็น 0 ใช้ mail.sedMail ส่งได้เลย
            result = result + resultSend;
            out.print(result);
            if(resultSend == 0){
                //out.println(" Mail Successfully Sent to "+to);
            }else{
                //out.println(" Mail NOT Sent to "+to);
            }
        }catch(Exception e){
            out.print(e);
        }
    }else if (type.equals("contact")){
        try{
            String name = new String(request.getParameter("name").getBytes("utf-8"), "utf-8");
            String email = new String(request.getParameter("email").getBytes("utf-8"), "utf-8");
            String subject = new String(request.getParameter("subject").getBytes("utf-8"), "utf-8");
            String message = new String(request.getParameter("message").getBytes("utf-8"), "utf-8");

            message += "<br/>------------------------------------------";
            message += "<br/>This mail is Send From Contact Page From " + name;
            message += "<br />Please Reply to mail " + email;
            message += "<br/>------------------------------------------";

            mail.setTo("efitness.admin@gmail.com");
            mail.setSubject(subject);
            mail.setMessage(message);

            String to = mail.getTo(); // ดึงค่าออกมาว่าจะส่งหาใคร
            int resultSend;
            resultSend = mail.sendMail(); // ถ้าไม่ error จะได้ออกมาเป็น 0 ใช้ mail.sedMail ส่งได้เลย
            if(resultSend == 0){
                out.print("1");
            }else{
                out.print("0");
            }
        }catch(Exception e){
            out.print(e);
        }
    }
%>