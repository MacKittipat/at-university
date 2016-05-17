package org.apache.jsp.page.query;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class selectdata_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/xml;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.apache.jasper.runtime.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
      out.write("\n");
      out.write("\n");
      bpm.QueryData myBean = null;
      synchronized (application) {
        myBean = (bpm.QueryData) _jspx_page_context.getAttribute("myBean", PageContext.APPLICATION_SCOPE);
        if (myBean == null){
          myBean = new bpm.QueryData();
          _jspx_page_context.setAttribute("myBean", myBean, PageContext.APPLICATION_SCOPE);
        }
      }
      out.write('\n');

    String userId = session.getAttribute("userId").toString();
    out.print(userId);
    ArrayList param = new ArrayList();
    param.add(userId);
    ResultSet result =  myBean.selectData("SELECT * FROM calendar WHERE user_id=?",param);
    out.print("<data>");
    while(result.next())
    {
        String id = new String(result.getString("id").getBytes("utf-8"), "utf-8");
        String startDate = new String(result.getString("start_date").getBytes("utf-8"), "utf-8");
        String endDate = new String(result.getString("end_date").getBytes("utf-8"), "utf-8");
        String text = new String(result.getString("text").getBytes("utf-8"), "utf-8");
        String details = new String(result.getString("details").getBytes("utf-8"), "utf-8");
        String calories = "";
        try{
            calories = new String(result.getString("calories").getBytes("utf-8"), "utf-8");
        }
        catch(Exception e)
        {}
        
        out.print("<event id='" + id + "'>");
        out.print("<start_date><![CDATA[" + startDate + "]]></start_date>");
        out.print("<end_date><![CDATA[" + endDate + "]]></end_date>");
        out.print("<text><![CDATA[" + text + "]]></text>");
        out.print("<details><![CDATA[" + details + "]]></details>");
        out.print("<calories><![CDATA[" + calories + "]]></calories>");
        out.print("</event>");
    }
    out.print("</data>");

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
