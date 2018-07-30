package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.util.*;
import net.sf.jasperreports.engine.export.*;
import net.sf.jasperreports.j2ee.servlets.*;
import java.util.*;
import java.io.*;
import java.sql.*;

public final class report_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/master/user-selector.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
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
      			"error.jsp", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Optosoft - Report Wizard</title>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("      \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        ");

            String SQL_DRIVER="com.mysql.jdbc.Driver";
            String SQL_URL="jdbc:mysql://localhost:3306/optosoft";
            Connection cn=null;
            Statement st = null;
            
            /*----------------------
            connection to database
            --------------------------*/

            try
            {
                Class.forName(SQL_DRIVER);
                cn=DriverManager.getConnection(SQL_URL,"root","rivendell");
                //out.print("\n connection successfull ");
            }catch(Exception e)
             {

                out.print("<script type=\"text/javascript\"> alert(\"Error occured while opening database "+e+"\"); </script>");
                //out.println("Error occured while opening database : "+e);
             }
             //retriving username and password of current user
             String username="",password="";
             
             try
             {
                st=cn.createStatement();
                String sql="select * from connected_users where  session_id = '"+request.getSession(true).getId()+"'";
                ResultSet rs = st.executeQuery(sql);
                if(rs.next())
                {
                    username = rs.getString("user_name");
                    password = rs.getString("user_password");
                }else
                {
                    out.print("<script type=\"text/javascript\"> alert(\"Oops!  cant get user information \"); </script>");
                }
             }catch(Exception e)
             {
                out.print("<script type=\"text/javascript\"> alert(\"Oops!  cant get user information \"); </script>");
             }
        
      out.write("\n");
      out.write("        ");

            java.util.Date tDate = new java.util.Date();
            String today=""+new java.sql.Date(tDate.getTime());
            
      out.write("\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("        ");

            try {
                    JasperReport jr=JasperCompileManager.compileReport("C:\\Users\\DONGRE\\Documents\\NetBeansProjects\\opticianOnWeb\\web\\Reports\\Dispensereport.jrxml");	
                    //JasperPrint jp=JasperFillManager.fillReport(jr,param,cn);
                    
                } catch (Exception e) {
			e.printStackTrace();
		}
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
