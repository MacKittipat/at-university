<%-- 
    Document   : patient-control
    Created on : 12 ก.ย. 2552, 14:34:28
    Author     : Kittipat_Mac
    โชว์ control ของ patient
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String username = request.getParameter("username");
    String image = request.getParameter("image");
%>

<div class="user-control">
    <div>
        <img src="upload/patient/<%= image %>" style="height:80px;width:80px;" alt="<%= username %>" />
    </div>
    <div>
        <a href="view_profile.jsp">
            <%= username %>
        </a>
    </div>
    <div id="menu">
        <a href="appointment.jsp">
            Make Appointment
        </a>
        <br />
        <a href="view_appointment.jsp">
            View Appointment
        </a>
    </div>
    <div style="padding-left:110px;">
        <a href="#" id="btnLogout">
            Logout
        </a>
    </div>
</div>
