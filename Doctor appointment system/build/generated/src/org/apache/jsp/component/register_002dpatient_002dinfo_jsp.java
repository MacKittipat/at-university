package org.apache.jsp.component;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_002dpatient_002dinfo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.apache.jasper.runtime.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<form id=\"form-regis-patient\" action=\"#\" method=\"post\">\n");
      out.write("    <table>\n");
      out.write("        <tr>\n");
      out.write("            <td width=\"150px\">\n");
      out.write("                Identification Number\n");
      out.write("            </td>\n");
      out.write("            <td width=\"200px\">\n");
      out.write("                : <input type=\"text\" id=\"txtIdNumber\" name=\"txtIdNumber\" />\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                Name\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                : <input type=\"text\" id=\"txtName\" name=\"txtName\" />\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                Lastname\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                : <input type=\"text\" id=\"txtLastname\" name=\"txtLastname\" />\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                Birthdate\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                : <input type=\"text\" id=\"txtBirthdate\" name=\"txtBirthdate\" />\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                Gender\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                :\n");
      out.write("                <select id=\"ddlGender\">\n");
      out.write("                    <option value=\"Male\">\n");
      out.write("                        Male\n");
      out.write("                    </option>\n");
      out.write("                    <option value=\"Female\">\n");
      out.write("                        Female\n");
      out.write("                    </option>\n");
      out.write("                </select>\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                Weight\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                : <input type=\"text\" id=\"txtWeight\" name=\"txtWeight\" />\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                Height\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                : <input type=\"text\" id=\"txtHeight\" name=\"txtHeight\" />\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                Blood Group\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                :\n");
      out.write("                <select id=\"ddlBloodGroup\">\n");
      out.write("                    <option value=\"A\">\n");
      out.write("                        A\n");
      out.write("                    </option>\n");
      out.write("                    <option value=\"B\">\n");
      out.write("                        B\n");
      out.write("                    </option>\n");
      out.write("                    <option value=\"O\">\n");
      out.write("                        O\n");
      out.write("                    </option>\n");
      out.write("                </select>\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                Address\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                : <textarea id=\"txtAddress\" name=\"txtAddress\" style=\"width:185px\" rows=\"3\"></textarea>\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                Telephone Number\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                : <input type=\"text\" id=\"txtTelNumber\" name=\"txtTelNumber\" />\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td>\n");
      out.write("                Image\n");
      out.write("            </td>\n");
      out.write("            <td>\n");
      out.write("                : <input type=\"file\" id=\"fileImage\" />\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("        <tr>\n");
      out.write("            <td colspan=\"2\">\n");
      out.write("                <input type=\"submit\" id=\"btnRegister\" value=\"Register\" />\n");
      out.write("            </td>\n");
      out.write("        </tr>\n");
      out.write("    </table>\n");
      out.write("</form>\n");
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
