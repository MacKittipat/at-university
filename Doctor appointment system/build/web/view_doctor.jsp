<%-- 
    Document   : viewdoctor
    Created on : 14 ก.ย. 2552, 17:28:33
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.sql.*,
                database.*"
        %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>Doctor Appoint System</title>
        <link rel="shortcut icon" href="images/clock.ico" />
        <!---StyleSheet--->
        <link rel="stylesheet" href="script/style.css" />
        <!--[StyleSheet]-->
        <!---jQuery--->
        <script type="text/javascript" src="script/lib/jquery/jquery.js"></script>
        <!--[jQuery]-->
        <!---jQuery-LiveQuery--->
        <script type="text/javascript" src="script/lib/jquery/jquery-livequery.js"></script>
        <!--[jQuery-LiveQuery]-->
        <!---jQuery-Pager--->
        <link rel="stylesheet" href="script/lib/jquery/jquery-pager.css" />
        <script type="text/javascript" src="script/lib/jquery/jquery-pager.js"></script>
        <!--[jQuery-Pager]-->        
        <!---Script Login--->
        <script type="text/javascript" src="script/component/login.js"></script>
        <!--[Script Login]-->
        <!---Script--->
        <script type="text/javascript" src="script/view-doctor.js"></script>
        <!--[Script]-->
    </head>
    <body>
    	<!---Header--->
        <div class="header">
            <div class="logo">
                <%@include file="component/logo.jspf" %>
            </div>
            <div class="bg-header">
                <%@include file="component/bg-header.jspf" %>
            </div>
    	</div>
        <!--[Header]-->
        <br />
        <!---Content--->
        <div class="content">
            <!---LeftContent--->
            <div class="l-content">
                <!---Navigate--->
                <div class="navigate">
                    <jsp:include page="component/navigate.jsp"></jsp:include>
                </div>
                <!--[Navigate]-->
                <br />
                <!---Login--->
                <div class="login">
                    <jsp:include page="component/login.jsp"></jsp:include>
                </div>
                <!--[Login]-->
            </div>
            <!--[LeftContent]-->
            <!---RightContent--->
            <div class="r-content">
                <h2>
                    View Doctor
                </h2>
                <div class="p-content">
                    <div>
                        <select id="ddlDepartment">
                            <option value="0">
                                &lt;&lt;&lt; Choose Department &gt;&gt;&gt;
                            </option>
                            <%
                                CreateConnection con = new CreateConnection();
                                String sql = "SELECT departmentId,departmentName FROM department";
                                PreparedStatement pre = con.getConnection().prepareStatement(sql);
                                ResultSet result = pre.executeQuery();
                                while(result.next()){
                                    out.print("<option value='" + result.getString("departmentId") + "'>" + result.getString("departmentName") + "</option>");
                                }
                            %>
                        </select>
                    </div>
                        <br />
                    <div id="doctor-list">
                    
                    </div>
                    <div id="pager" ></div>
                </div>
            </div>
            <!--[RightContent]-->
        </div>
        <!--[Content]-->
        <br />
        <!---Footer--->
        <div class="footer">
            <jsp:include page="component/footer.jsp"></jsp:include>
        </div>
        <!--[Footer]-->
    </body>
</html>
