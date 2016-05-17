<%-- 
    Document   : admin-control
    Created on : 12 ก.ย. 2552, 14:35:54
    Author     : Kittipat_Mac
    โชว์ control ของ admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String username = request.getParameter("username");
    String image = request.getParameter("image");
%>

<div class="user-control">
    <div>
        <img src="<%= image %>" style="height:80px;width:80px;" alt="<%= username %>" />
    </div>
    <div>
        <%= username %>
    </div>
    <div id="menu">
        <a href="admin_register_doctor.jsp">
            Register Doctor
        </a>

        <br />
        <a href="admin_view_patient.jsp">
            View Patient
        </a>
        <br />
        <a href="admin_view_appointment.jsp">
            View Appointment
        </a>
    </div>
    <div style="padding-left:110px;">
        <a href="#" id="btnLogout">
            Logout
        </a>
    </div>
</div>

