package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import database.*;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.export.*;
import net.sf.jasperreports.engine.design.*;
import net.sf.jasperreports.engine.xml.*;
import net.sf.jasperreports.view.*;

public final class report_005fappointment_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    ResultSet result = null;
    String appointmentId = request.getParameter("aid");
    appointmentId = "1";
    String patientId = "";
    String doctorId = "";
    String date = "";
    String time = "";
    String detail = "";

    String sql = "SELECT patientId,doctorId,date,time,detail FROM appointment WHERE appointmentId=?";
    PreparedStatement pre = con.getConnection().prepareStatement(sql);
    pre.setString(1, appointmentId);
    result = pre.executeQuery();

    if(result.first()){
        date = result.getString("date");
        time = result.getString("time");
        detail = result.getString("detail");
    }
    String dates = date.split("-")[2];
    String months = date.split("-")[1];
    String years = date.split("-")[0];
    int year = Integer.parseInt(years) + 543; //แปลงปีให้เป็น พ.ศ.
    date = year + "/" + months + "/" + dates; //วันที่จะแสดงใน report
    response.setContentType("application/pdf");

    Map parameters = new HashMap();
    parameters.put("patientId", patientId);
    parameters.put("doctorId", doctorId);
    parameters.put("date", date);
    parameters.put("time", time);
    parameters.put("detail", detail);
    InputStream inputStream = new FileInputStream(application.getRealPath("WEB-INF/classes/report_appointment.jasper"));
    JasperRunManager.runReportToPdfStream(inputStream, response.getOutputStream(), parameters, con.getConnection());

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
