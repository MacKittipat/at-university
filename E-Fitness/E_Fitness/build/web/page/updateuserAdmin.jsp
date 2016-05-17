<%@page contentType="text/xml" pageEncoding="UTF-8"%>
<%@page import="java.sql.* ,java.util.*" %>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>
<%
    try{

        String max_execution_time = "600";

        String row_id = "";
        String temprow_id = request.getParameter("row_id");
        if(temprow_id != null){
            row_id = temprow_id;
        }
        String row_name = "";
        String temprow_name = request.getParameter("row_name");
        if(temprow_name != null){
            row_name = temprow_name;
        }

        String row_surname = "";
        String temprow_surname = request.getParameter("row_surname");
        if(temprow_surname != null){
            row_surname = temprow_surname;
        }
        String row_birthday = "";
        String temprow_birthday = request.getParameter("row_birthday");
        if(temprow_birthday != null){
            row_birthday = temprow_birthday;
        }
        String row_address = "";
        String temprow_address = request.getParameter("row_address");
        if(temprow_address != null){
            row_address = temprow_address;
        }
        String row_phone = "";
        String temprow_phone = request.getParameter("row_phone");
        if(temprow_phone != null){
            row_phone = temprow_phone;
        }
        String row_create_date = "";
        String temprow_create_date = request.getParameter("row_create_date");
        if(temprow_create_date != null){
            row_create_date = temprow_create_date;
        }
        String row_last_login_date = "";
        String temprow_last_login_date = request.getParameter("row_last_login_date");
        if(temprow_last_login_date != null){
            row_last_login_date = temprow_last_login_date;
        }
        String row_email = "";
        String temprow_email = request.getParameter("row_email");
        if(temprow_email != null){
            row_email = temprow_email;
        }
        String row_active = "";
        String temprow_active = request.getParameter("row_active");
        if(temprow_active != null){
            row_active = temprow_active;
        }
        String row_receiveNews = "";
        String temprow_receiveNews = request.getParameter("row_receiveNews");
        if(temprow_receiveNews != null){
            row_receiveNews = temprow_receiveNews;
        }

        ArrayList param = new ArrayList();
        param.add(row_name);
        param.add(row_surname);
        param.add(row_birthday);
        param.add(row_address);
        param.add(row_phone);
        param.add(row_create_date);
        param.add(row_last_login_date);
        param.add(row_email);
        param.add(row_active);
        param.add(row_receiveNews);
        param.add(row_id);
        
        int result = myBean.queryData("UPDATE user SET name=?,surname=?,birthday=?,address=?,phone=?,create_date=?,last_login_date=?,email=?,active=?,receiveNews=? WHERE id=?",param);
        



    }catch(Exception e){
        System.out.println(e);
    }


%>