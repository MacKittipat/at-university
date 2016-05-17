package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import database.*;

public final class register_002ddoctor_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  static {
    _jspx_dependants = new java.util.Vector(2);
    _jspx_dependants.add("/component/logo.jspf");
    _jspx_dependants.add("/component/bg-header.jspf");
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n");
      out.write("        <title>Doctor Appoint System</title>\n");
      out.write("        <link rel=\"shortcut icon\" href=\"images/clock.ico\" />\n");
      out.write("        <!---StyleSheet--->\n");
      out.write("        <link rel=\"stylesheet\" href=\"script/style.css\" />\n");
      out.write("        <!--[StyleSheet]-->\n");
      out.write("        <!---jQuery--->\n");
      out.write("        <script type=\"text/javascript\" src=\"script/lib/jquery/jquery.js\"></script>\n");
      out.write("        <!--[jQuery]-->\n");
      out.write("        <!---jQuery-LiveQuery--->\n");
      out.write("        <script type=\"text/javascript\" src=\"script/lib/jquery/jquery-livequery.js\"></script>\n");
      out.write("        <!--[jQuery-LiveQuery]-->\n");
      out.write("        <!---jQuery-Validate--->\n");
      out.write("        <script type=\"text/javascript\" src=\"script/lib/jquery/jquery-validate.js\"></script>\n");
      out.write("        <!--[jQuery-Validate]-->\n");
      out.write("        <!---Script Login--->\n");
      out.write("        <script type=\"text/javascript\" src=\"script/component/login.js\"></script>\n");
      out.write("        <!--[Script Login]-->\n");
      out.write("        <!--[AjaxUpload]-->\n");
      out.write("        <script type=\"text/javascript\" src=\"script/lib/ajaxupload/ajaxupload.js\"></script>\n");
      out.write("        <!---AjaxUpload--->\n");
      out.write("        <!---Script--->\n");
      out.write("        <script type=\"text/javascript\" src=\"script/register-doctor.js\"></script>\n");
      out.write("        <!--[Script]-->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    \t<!---Header--->\n");
      out.write("        <div class=\"header\">\n");
      out.write("            <div class=\"logo\">\n");
      out.write("                ");
      out.write("<a href=\"index.jsp\">\n");
      out.write("    <img src=\"images/logo.png\" alt=\"logo\" />\n");
      out.write("</a>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"bg-header\">\n");
      out.write("                ");
      out.write("<img src=\"images/bg-header.jpg\" alt=\"appointment\" />");
      out.write("\n");
      out.write("            </div>\n");
      out.write("    \t</div>\n");
      out.write("        <!--[Header]-->\n");
      out.write("        <br />\n");
      out.write("        <!---Content--->\n");
      out.write("        <div class=\"content\">\n");
      out.write("            <!---LeftContent--->\n");
      out.write("            <div class=\"l-content\">\n");
      out.write("                <!---Navigate--->\n");
      out.write("                <div class=\"navigate\">\n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "component/navigate.jsp", out, false);
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <!--[Navigate]-->\n");
      out.write("                <br />\n");
      out.write("                <!---Login--->\n");
      out.write("                <div class=\"login\">\n");
      out.write("                    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "component/login.jsp", out, false);
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <!--[Login]-->\n");
      out.write("            </div>\n");
      out.write("            <!--[LeftContent]-->\n");
      out.write("            <!---RightContent--->\n");
      out.write("            <div class=\"r-content\">\n");
      out.write("                <h2>\n");
      out.write("                    Register Doctor\n");
      out.write("                </h2>\n");
      out.write("                <div class=\"p-content\">\n");
      out.write("                    <form class=\"form-regis-doctor\" action=\"#\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("                        <table>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>\n");
      out.write("                                    Name\n");
      out.write("                                </td>\n");
      out.write("                                <td>\n");
      out.write("                                    : <input type=\"text\" id=\"txtName\" name=\"txtName\">\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>\n");
      out.write("                                    Lastname\n");
      out.write("                                </td>\n");
      out.write("                                <td>\n");
      out.write("                                    : <input type=\"text\" id=\"txtLastname\" name=\"txtLastname\">\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>\n");
      out.write("                                    Gender\n");
      out.write("                                </td>\n");
      out.write("                                <td>\n");
      out.write("                                    :\n");
      out.write("                                    <select id=\"ddlGender\">\n");
      out.write("                                        <option value=\"Male\">\n");
      out.write("                                            Male\n");
      out.write("                                        </option>\n");
      out.write("                                        <option value=\"Female\">\n");
      out.write("                                            Female\n");
      out.write("                                        </option>\n");
      out.write("                                    </select>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>\n");
      out.write("                                    Telephone Number\n");
      out.write("                                </td>\n");
      out.write("                                <td>\n");
      out.write("                                    : <input type=\"text\" id=\"txtTelNumber\" name=\"txtTelNumber\" />\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>\n");
      out.write("                                    Email\n");
      out.write("                                </td>\n");
      out.write("                                <td>\n");
      out.write("                                    : <input type=\"text\" id=\"txtEmail\" name=\"txtEmail\">\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>\n");
      out.write("                                    Department\n");
      out.write("                                </td>\n");
      out.write("                                <td>\n");
      out.write("                                    :\n");
      out.write("                                    <select id=\"ddlDepartment\">\n");
      out.write("                                        ");

                                            CreateConnection con = new CreateConnection();
                                            String sql = "SELECT departmentId,departmentName FROM department";
                                            PreparedStatement pre = con.getConnection().prepareStatement(sql);
                                            ResultSet result = pre.executeQuery();
                                            while(result.next()){
                                                out.print("<option value='" + result.getString("departmentId") + "'>" + result.getString("departmentName") + "</option>");
                                            }
                                        
      out.write("\n");
      out.write("                                    </select>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>\n");
      out.write("                                    Work Time\n");
      out.write("                                </td>\n");
      out.write("                                <td>\n");
      out.write("                                    <table>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <td>\n");
      out.write("                                                : <input type=\"checkbox\" id=\"chkTime1\" value=\"8.00-9.00\" /> 8.00-9.00\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <td>\n");
      out.write("                                                &nbsp;&nbsp;<input type=\"checkbox\" id=\"chkTime2\" value=\"9.00-10.00\" /> 9.00-10.00\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <td>\n");
      out.write("                                                &nbsp;&nbsp;<input type=\"checkbox\" id=\"chkTime3\" value=\"10.00-11.00\" /> 10.00-11.00\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <td>\n");
      out.write("                                                &nbsp;&nbsp;<input type=\"checkbox\" id=\"chkTime4\" value=\"11.00-12.00\" /> 11.00-12.00\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <td>\n");
      out.write("                                                &nbsp;&nbsp;<input type=\"checkbox\" id=\"chkTime5\" value=\"12.00-13.00\" /> 12.00-13.00\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <td>\n");
      out.write("                                                &nbsp;&nbsp;<input type=\"checkbox\" id=\"chkTime6\" value=\"13.00-14.00\" /> 13.00-14.00\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <td>\n");
      out.write("                                                &nbsp;&nbsp;<input type=\"checkbox\" id=\"chkTime7\" value=\"14.00-15.00\" /> 14.00-15.00\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <td>\n");
      out.write("                                                &nbsp;&nbsp;<input type=\"checkbox\" id=\"chkTime8\" value=\"15.00-16.00\" /> 15.00-16.00\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <td>\n");
      out.write("                                                &nbsp;&nbsp;<input type=\"checkbox\" id=\"chkTime9\" value=\"16.00-17.00\" /> 16.00-17.00\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        <tr>\n");
      out.write("                                            <td>\n");
      out.write("                                                &nbsp;&nbsp;<input type=\"checkbox\" id=\"chkTime10\" value=\"17.00-18.00\" /> 17.00-18.00\n");
      out.write("                                            </td>\n");
      out.write("                                        </tr>\n");
      out.write("                                    </table>                                    \n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td>\n");
      out.write("                                    Image\n");
      out.write("                                </td>\n");
      out.write("                                <td>\n");
      out.write("                                    : <span id=\"uploadimage\"><a href=\"#\">Upload</a></span><span style=\"display:block;\" id=\"uploadmsg\"></span>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                            <tr>\n");
      out.write("                                <td colspan=\"2\">\n");
      out.write("                                    <input type=\"submit\" id=\"btnRegister\" value=\"Register\" />\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                        </table>\n");
      out.write("                    </form>   \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <!--[RightContent]-->\n");
      out.write("        </div>\n");
      out.write("        <!--[Content]-->\n");
      out.write("        <br />\n");
      out.write("        <!---Footer--->\n");
      out.write("        <div class=\"footer\">\n");
      out.write("            ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "component/footer.jsp", out, false);
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <!--[Footer]-->\n");
      out.write("    </body>\n");
      out.write("</html>");
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
