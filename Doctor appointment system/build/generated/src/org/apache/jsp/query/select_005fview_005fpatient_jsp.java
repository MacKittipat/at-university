package org.apache.jsp.query;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import database.*;

public final class select_005fview_005fpatient_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.apache.jasper.runtime.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.apache.jasper.runtime.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    CreateConnection con = new CreateConnection();
    String pageNum = request.getParameter("pageNum");//หลามเลขของเพจที่ดูอยู่
    String sql = "SELECT name,lastname,birthdate,gender,weight,height,bloodGroup,address,telNumber,email,image FROM patient ORDER BY patientId ASC LIMIT ?,5";
    PreparedStatement pre = con.getConnection().prepareStatement(sql);
    pre.setInt(1, (Integer.parseInt(pageNum)*5)-5);
    ResultSet result = pre.executeQuery();
    String color = "#ebebeb";
    int i = 0;
    while(result.next()){
        if(i % 2 == 0){
            color = "#ffffff";
        }else{
            color = "#ebebeb";
        }
        String name = result.getString("name");
        String lastname = result.getString("lastname");
        String birthdate = result.getString("birthdate");
        String gender = result.getString("gender");
        String weight = result.getString("weight");
        String height = result.getString("height");
        String bloodGroup = result.getString("bloodGroup");
        String address = result.getString("address");
        String telNumber = result.getString("telNumber");
        String email = result.getString("email");
        String image = result.getString("image");
        out.print("<div style='padding:5px 5px 5px 5px;background-color:" + color + ";width:555px' id='patient-detail'>" +
                name + 
                "<div>");
    }

      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
