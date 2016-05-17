package org.apache.jsp.query;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import database.*;

public final class select_005fdoctor_005fname_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String departmentId = request.getParameter("departmentId");
    CreateConnection con = new CreateConnection();
    ResultSet result = null;
    if(departmentId.equals("0")){//department เป็น 0 คือ ไม่ได้เลือก department ใดจะแสดง doctor ทั้งหมด
        String sql = "SELECT name,lastname FROM doctor";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        result = pre.executeQuery();
    }else{//department ไม่เป็น 0 คือมีการเลือก department จะแสดงหมอใน department นั้นๆ
        String sql = "SELECT name,lastname FROM doctor WHERE departmentId=?";
        PreparedStatement pre = con.getConnection().prepareStatement(sql);
        pre.setString(1, "4");
        result = pre.executeQuery();
    }
    out.print("<select id='ddlDoctor' style='width:335px;'>");
    out.print("<option value='0'>&lt;&lt;&lt; Choose Doctor &gt;&gt;&gt;</option>");
    while(result.next()){
        out.print("<option value='" + result.getString("name") + " " + result.getString("lastname") + "'>");
    }
    out.print("</select>");

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
