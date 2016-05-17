package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class calendar_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n");
      out.write("   \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Calendar</title>\n");
      out.write("            <link rel=\"stylesheet\" type=\"text/css\" href=\"lib/dhtmlxscheduler/dhtmlxscheduler.css\"/>\n");
      out.write("            <script type=\"text/javascript\" src=\"lib/dhtmlxscheduler/dhtmlxscheduler.js\"></script>\n");
      out.write("            <script type=\"text/javascript\" src=\"lib/pages/calendar.js\"></script>\n");
      out.write("        <!-- ******** -->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("            ");

                //รับชื่อ username
                String username ="";
                String userId = "";
                out.print(session.getAttribute("userId"));
                try
                {
                    username = session.getAttribute("username").toString();
                    userId = session.getAttribute("userId").toString();
                }
                catch(Exception e)
                {}
                if(username == null || username=="")
                {
            
      out.write("\n");
      out.write("                     \n");
      out.write("            ");

                }
            
      out.write("     \n");
      out.write("        <div id=\"scheduler_here\" class=\"dhx_cal_container\" style='width:740px; height:450px;'>\n");
      out.write("            <div class=\"dhx_cal_navline\">\n");
      out.write("                <div class=\"dhx_cal_prev_button\">&nbsp;</div>\n");
      out.write("                <div class=\"dhx_cal_next_button\">&nbsp;</div>\n");
      out.write("                <div class=\"dhx_cal_today_button\"></div>\n");
      out.write("                <div class=\"dhx_cal_date\"></div>\n");
      out.write("                <div class=\"dhx_cal_tab\" name=\"day_tab\" style=\"right:204px;\"></div>\n");
      out.write("                <div class=\"dhx_cal_tab\" name=\"week_tab\" style=\"right:140px;\"></div>\n");
      out.write("                <div class=\"dhx_cal_tab\" name=\"month_tab\" style=\"right:76px;\"></div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"dhx_cal_header\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"dhx_cal_data\">\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
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
