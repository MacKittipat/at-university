package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class admin_005fmain_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  static {
    _jspx_dependants = new java.util.Vector(3);
    _jspx_dependants.add("/admin/report/report-user-list.jsp");
    _jspx_dependants.add("/edituser_admin.jsp");
    _jspx_dependants.add("/page/component/footer.jspf");
  }

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
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Manage Field : Admin Only</title>\n");
      out.write("        <link rel=\"shortcut icon\" href=\"images/favicon.ico\">\n");
      out.write("        <link type=\"text/css\" href=\"css/main.css\" rel=\"stylesheet\" />\n");
      out.write("        <!-- jQuery -->\n");
      out.write("            <link type=\"text/css\" href=\"css/custom-theme/jquery-ui-1.7.2.custom.css\" rel=\"stylesheet\" />\n");
      out.write("            <script type=\"text/javascript\" src=\"lib/jquery/jquery.js\"></script>\n");
      out.write("            <!--<script type=\"text/javascript\" src=\"lib/jquery/jquery-ui-1.7.2.custom.min.js\"></script>-->\n");
      out.write("            <script type=\"text/javascript\" src=\"lib/timepicker/jquery.ui.all.js\"></script>\n");
      out.write("        <!-- ****** -->\n");
      out.write("        <!-- liveQuery -->\n");
      out.write("            <script type=\"text/javascript\" src=\"lib/livequery/jquery.livequery.js\"></script>\n");
      out.write("        <!-- ****** -->\n");
      out.write("        <!-- custom jquery ui framework -->\n");
      out.write("            <link type=\"text/css\" href=\"css/fg.menu.css\" media=\"screen\" rel=\"stylesheet\" />\n");
      out.write("            <link type=\"text/css\" href=\"css/fg-button.css\" media=\"screen\" rel=\"stylesheet\" />\n");
      out.write("        <!-- ******** -->\n");
      out.write("        <script type=\"text/javascript\" src=\"lib/admin_main.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            try{
                String adminCheck = session.getAttribute("username").toString();
                if(!(adminCheck.equals("admin"))){
                    response.sendRedirect("first_page.jsp");
                }
            }catch(Exception e){
                response.sendRedirect("first_page.jsp");
            }

        
      out.write("\n");
      out.write("        <div id=\"container\">\n");
      out.write("            <div id=\"header\">\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div id=\"content\">\n");
      out.write("                <div id=\"panel-left\">\n");
      out.write("                    <div id=\"task-panel\" class=\"ui-state-default\">\n");
      out.write("                        <div class=\"ui-widget-header ui-corner-all ui-helper-clearfix\">\n");
      out.write("                            <center><a class=\"header-section\">Menu</a></center>\n");
      out.write("                        </div>\n");
      out.write("                        <fieldset id=\"task-detail-wrap\">\n");
      out.write("                            <br />\n");
      out.write("                            <input type =\"button\" id = \"btnIndex\" value =\"Go to Home\" class=\"fg-button ui-state-default ui-corner-all\" />\n");
      out.write("                            <br />\n");
      out.write("                            <br />\n");
      out.write("                            <input type =\"button\" id = \"btnEdituser\" value =\"Manage User\" class=\"fg-button ui-state-default ui-corner-all\" />\n");
      out.write("                            <br />\n");
      out.write("                            <br />\n");
      out.write("                            <input type =\"button\" id = \"btnReport\" value =\"Generate Report\" class=\"fg-button ui-state-default ui-corner-all\" />\n");
      out.write("                            <br />\n");
      out.write("                        </fieldset>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"panel-right\">\n");
      out.write("                    <div class=\"ui-widget-header ui-corner-all ui-helper-clearfix\">\n");
      out.write("                        <center><font color=\"#1c94c4\">Detail</font></center>\n");
      out.write("                    </div>\n");
      out.write("                    <fieldset id=\"reportAdmin\" style =\" display:none;width:700px;height:358px;overflow:scroll;\" >\n");
      out.write("                        ");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Admin</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <form action=\"admin/report/report-user-list-pdf.jsp\" method=\"post\">\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Active\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"radio\" name=\"radActive\" value=\"active\" />\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        Unactive\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"radio\" name=\"radActive\" value=\"unactive\" />\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>\n");
      out.write("                        All\n");
      out.write("                    </td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"radio\" name=\"radActive\" value=\"all\" />\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("            <input type=\"submit\" name=\"submit\" value=\"Submit\" />\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("                    </fieldset>\n");
      out.write("                    <fieldset id=\"gridUser\" style =\"display:none;width:700px;overflow:scroll;\" >\n");
      out.write("                        ");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Manage User</title>\n");
      out.write("        <!-- jGrid -->\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"lib/jgrid/theme/basic/grid.css\" />\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" media=\"screen\" href=\"lib/jgrid/theme/jqModal.css\" />\n");
      out.write("        <script src=\"lib/jgrid/jquery.jqGrid.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"lib/jgrid/js/jqModal.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"lib/jgrid/js/jqDnR.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script src=\"lib/pages/edituser_admin.js\" type=\"text/javascript\"></script>\n");
      out.write("        <!-- ****** -->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <table id=\"list\" class=\"scroll\"></table>\n");
      out.write("        <div id=\"pager\" class=\"scroll\" style=\"text-align:center;width:700px;\"></div>\n");
      out.write("        <select name=\"searchType\" id =\"searchType\">\n");
      out.write("            <option value =\"username\">Username</option>\n");
      out.write("            <option value =\"email\" >E-Mail</option>\n");
      out.write("            <option value =\"name\" >Name</option>\n");
      out.write("        </select> <span id=\"Gender_Status_Icon_1\"></span>\n");
      out.write("        <input type =\"text\" id =\"txtSearch\" onkeyup=\"autoSubmit()\" />\n");
      out.write("        <input type=\"checkbox\" id=\"autosearch\" onclick=\"enableAutosubmit(this.checked)\"> Enable Autosearch\n");
      out.write("        <input type =\"button\" id = \"btnSearch\" onclick=\"gridReload()\" value =\"Search\" />\n");
      out.write("        <br />\n");
      out.write("        <input type =\"button\" id =\"btnEdit\" value =\"Edit\" />\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("                    </fieldset>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div id=\"footer\">\n");
      out.write("                ");
      out.write("\n");
      out.write("<div class=\"fg-toolbar ui-widget-header ui-corner-all ui-helper-clearfix\">\n");
      out.write("    <center><font color=\"#1c94c4\">Thanks you for visited E-Fitness Partner of Your Health</font></center>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
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
