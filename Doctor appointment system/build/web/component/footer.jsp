<%@include file="page-var.jsp" %>
<div id="title">
    Doctor Appointment System.
</div>
<br />
<div id="site-map" style="background-color:#ebebeb;text-align:center;padding-top:10px;padding-bottom:10px;">
    <%
        for(int i=0;i<pages.length;i++){
            if(i==pages.length-1){
                out.print("<span> <a href='" + pages[i] + "'>" + pagesName[i] + "</a> </span>");
            }else{
                out.print("<span> <a href='" + pages[i] + "'>" + pagesName[i] + "</a> | </span>");
            }
        }
    %>    
</div>