<%@page contentType="text/xml" pageEncoding="UTF-8"%>
<%@page import="java.sql.* ,java.util.*" %>
<jsp:useBean id="myBean" scope="application" class="bpm.QueryData"></jsp:useBean>

<%
    try{
        

        double pageG = 1;
        String tempPage = request.getParameter("page");
        if(tempPage != null){
            pageG = Double.parseDouble(tempPage);
        }

        System.out.println(pageG);

        double limit = 10;
        String tempLimit = request.getParameter("rows");
        if(tempLimit != null){
            limit = Double.parseDouble(tempLimit);
        }

        String sidx = "id";
        String tempSidx = request.getParameter("sidx");
        if(tempSidx != null){
            sidx = tempSidx;
        }



        String sord = "asc";
        String tempSord = request.getParameter("sord");
        if(tempSord != null){
            sord = tempSord;
        }



        double total_pages = 0;
        double start = limit * pageG - limit;
        System.out.println("SELECT * FROM user ORDER BY " + sidx + " " +sord + " LIMIT " + (int)start + "," + (int)limit);
        ArrayList param = new ArrayList();
        ResultSet rs = myBean.selectData("SELECT * FROM user ORDER BY " + sidx + " " +sord + " LIMIT " + (int)start + "," + (int)limit);
        rs.last();

        

        ArrayList param2 = new ArrayList();
        ResultSet rs2 = myBean.selectData("SELECT * FROM user");
        rs2.last();

        int count = rs.getRow();
        int total_row = rs2.getRow();

        if( count > 0 ) {
            total_pages = Math.ceil(total_row/limit);
        } else {
            total_pages = 0;
        }


        if (pageG > total_pages) pageG = total_pages;


        if(start < 0) start = 0;

        rs.beforeFirst();

        out.print( "<rows>\n");
        out.print( "<page>"+ (int)pageG +"</page>\n");
        out.print( "<total>" + (int)total_pages +"</total>\n");
        out.print( "<records>" + count + "</records>\n");

        while(rs.next()) {
            out.print( "<row id='" + rs.getString("id") +"'>\n");
                out.print( "<cell> </cell>\n");
                out.print( "<cell>"+ rs.getString("id") +"</cell>\n");
                out.print( "<cell>"+ rs.getString("username") +"</cell>\n");
                out.print( "<cell>"+ rs.getString("name") +"</cell>\n");
                out.print( "<cell>"+ rs.getString("surname") +"</cell>\n");
                out.print( "<cell>"+ rs.getDate("birthday") +"</cell>\n");
                out.print( "<cell>"+ rs.getString("address") +"</cell>\n");
                out.print( "<cell>"+ rs.getString("phone") +"</cell>\n");
                out.print( "<cell>"+ rs.getDate("create_date") +"</cell>\n");
                out.print( "<cell>"+ rs.getDate("last_login_date") +"</cell>\n");
                out.print( "<cell>"+ rs.getString("email") +"</cell>\n");
                out.print( "<cell>"+ rs.getString("active") +"</cell>\n");
                out.print( "<cell>"+ rs.getString("receiveNews") +"</cell>\n");
            out.print( "</row>");
        }
        out.print ("</rows>\n");
    }catch(Exception e){
        System.out.println(e);
    }
%>