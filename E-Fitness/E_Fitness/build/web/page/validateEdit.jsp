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
    
    if(type.equals("password")){
        ArrayList param = new ArrayList();
        String username = request.getParameter("txtUsername");
        String opassword = request.getParameter("txtOPassword");
        param.add(username);
        param.add(opassword);
        ResultSet rs = myBean.selectData("select * from user where username = ? and password = ? ",param);
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

            ArrayList param = new ArrayList();
            
            param.add(password);
            param.add(email);
            param.add(name);
            param.add(surname);
            param.add(gender);
            param.add(birthday);
            param.add(address);
            param.add(phone);
            param.add(receive);

            param.add(username);
            int result = myBean.queryData("UPDATE user set password = ? ,email = ? ,name = ?,surname = ? , gender = ? ,birthday = ? ,address = ? ,phone = ? ,receiveNews = ? where username = ?",param);

            out.print(result);
        }catch(Exception e){
            out.print("0");
        }
    }
    
%>