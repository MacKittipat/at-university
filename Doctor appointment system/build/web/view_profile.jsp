<%-- 
    Document   : viewprofile
    Created on : 5 ก.ย. 2552, 17:29:44
    Author     : Kittipat_Mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import="user.*,
        database.*,
        java.sql.*"
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
        <!---Script Login--->
        <script type="text/javascript" src="script/component/login.js"></script>
        <!--[Script Login]-->
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
                    View Profile
                </h2>
                <div class="p-content">
                    <%
                        CreateConnection con = new CreateConnection();
                        String patientId = request.getParameter("patientId");
                        if(patientId==null){
                            //ไม่มีการส่ง patientId มาจะหา patientId จาก username
                            String username = session.getAttribute("username").toString();
                            String sql = "SELECT patient.patientId FROM patient,user WHERE user.username=? AND patient.userId=user.userId";
                            PreparedStatement pre = con.getConnection().prepareStatement(sql);
                            pre.setString(1, username);
                            ResultSet result = pre.executeQuery();
                            if(result.first()){
                                patientId = result.getString("patient.patientId");
                            }    
                        }
                        OldPatient oldPatient = new OldPatient(patientId);
                        String idNumber = oldPatient.getIdNumber();
                        String name = oldPatient.getName();
                        String lastname = oldPatient.getLastname();
                        String birthdate = oldPatient.getBirthdate();
                        String gender = oldPatient.getGender();
                        float weight = oldPatient.getWeight();
                        float height = oldPatient.getHeight();
                        String bloodGroup = oldPatient.getBloodGroup();
                        String address = oldPatient.getAddress();
                        String telNumber = oldPatient.getTelNumber();
                        String email = oldPatient.getEmail();
                        String image = oldPatient.getImage();
                    %>
                    <table>
                        <tr>
                            <td colspan="2">
                                <img src="upload/patient/<%= image %>" alt="<%= image %>"/>
                            </td>
                        </tr>
                        <tr>
                            <td width="150px">
                                Name
                            </td>
                            <td width="200px">
                                : <%=name%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Lastname
                            </td>
                            <td>
                                : <%=lastname%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Birthdate
                            </td>
                            <td>
                                : <%=birthdate%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Gender
                            </td>
                            <td>
                                : <%=gender%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Weight
                            </td>
                            <td>
                                : <%=weight%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Height
                            </td>
                            <td>
                                : <%=height%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Blood Group
                            </td>
                            <td>
                                : <%=bloodGroup%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Address
                            </td>
                            <td>
                                : <%=address%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Telephone Number
                            </td>
                            <td>
                                : <%=telNumber%>
                            </td>
                        </tr>
                    </table>
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