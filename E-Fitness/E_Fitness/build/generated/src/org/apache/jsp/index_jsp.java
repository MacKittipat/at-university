package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("^\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title> E-Fitness :: Partner of your Life </title>\n");
      out.write("        <!-- jQuery -->\n");
      out.write("            <link type=\"text/css\" href=\"css/custom-theme/jquery-ui-1.7.2.custom.css\" rel=\"stylesheet\" />\n");
      out.write("            <script type=\"text/javascript\" src=\"lib/jquery/jquery.js\"></script>\n");
      out.write("            <script type=\"text/javascript\" src=\"lib/timepicker/jquery.ui.all.js\"></script>\n");
      out.write("        <!-- ****** -->\n");
      out.write("        <!-- custom jquery ui framework -->\n");
      out.write("            <link type=\"text/css\" href=\"css/fg.menu.css\" media=\"screen\" rel=\"stylesheet\" />\n");
      out.write("            <link type=\"text/css\" href=\"css/fg-button.css\" media=\"screen\" rel=\"stylesheet\" />\n");
      out.write("        <!-- ******** -->\n");
      out.write("        <script type=\"text/javascript\" src=\"lib/pages/index.js\"></script>\n");
      out.write("        <link type=\"text/css\" href=\"css/index.css\" media=\"screen\" rel=\"stylesheet\" />\n");
      out.write("    </head>\n");
      out.write("    <body style =\"background-color:black\">\n");
      out.write("        <div ID =\"all_content\">\n");
      out.write("            ");
 
                if((session.getAttribute("username")!=null && session.getAttribute("username")!="")){
                    response.sendRedirect("home.jsp");
                }
            
      out.write("\n");
      out.write("            <div ID =\"header\">\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("            <div ID =\"content\">\n");
      out.write("                <div ID = \"left\" class =\"ui-state-default\" >\n");
      out.write("                    <div style =\"padding:15px\">\n");
      out.write("                        <form action=\"page/checkLogin.jsp\" method =\"post\">\n");
      out.write("                            <div class=\"ui-widget-header ui-corner-all ui-helper-clearfix\">\n");
      out.write("                                <center><a class=\"header-section\">Sign In</a></center>\n");
      out.write("                            </div>\n");
      out.write("                            <br />\n");
      out.write("                            <br />\n");
      out.write("                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                            E-Fitness Id : <input type =\"text\" name =\"Lusername\" id = \"loginUsername\"  />\n");
      out.write("                            <br />\n");
      out.write("                            <br />\n");
      out.write("                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                            &nbsp;&nbsp;&nbsp;Password : <input type =\"password\" name =\"Lpassword\" id = \"loginPassword\" />\n");
      out.write("                            <br />\n");
      out.write("                            <br />\n");
      out.write("\n");
      out.write("                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                            &nbsp;&nbsp;&nbsp;<input type=\"checkbox\" checked =\"checked\" name=\"rememberId\" value=\"memId\" />Remember me on this computer\n");
      out.write("                            <br />\n");
      out.write("                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                            &nbsp;&nbsp;&nbsp;<input type=\"checkbox\" name=\"rememberPass\" value=\"memPass\" />Remember my password\n");
      out.write("                            <br />\n");
      out.write("                            <br />\n");
      out.write("                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                            &nbsp;&nbsp;&nbsp;<input type =\"submit\" id =\"btnSignin\" value = \"Sign In\" class=\"fg-button ui-state-default ui-corner-all\" />\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div ID = \"right\" class =\"ui-state-default\" >\n");
      out.write("                    <div style =\"padding:15px\">\n");
      out.write("                        <div class=\"ui-widget-header ui-corner-all ui-helper-clearfix\">\n");
      out.write("                                <center><a class=\"header-section\">E-Fitness</a></center>\n");
      out.write("                            </div>\n");
      out.write("                        <br />\n");
      out.write("                        <br />\n");
      out.write("                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Powerful trainer for exercise.<br />\n");
      out.write("                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Easy and quick to make exercise schedule. <br />\n");
      out.write("                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Calculate Calory and show the muscle that's effected. <br />\n");
      out.write("\n");
      out.write("                        &nbsp;&nbsp;Learn more<br />\n");
      out.write("                        &nbsp;&nbsp;Don't have a E-Fitness ID ?\n");
      out.write("                        <br />\n");
      out.write("                        <br />\n");
      out.write("                        <input type =\"button\" id =\"btnSignup\" value = \"Sign Up\" class=\"fg-button ui-state-default ui-corner-all\" />\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
