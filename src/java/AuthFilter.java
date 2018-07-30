
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author DONGRE
 */
public class AuthFilter implements Filter{

    
    String SQL_DRIVER="com.mysql.jdbc.Driver";
    String SQL_URL="jdbc:mysql://localhost:3306/optosoft";
    Connection cn=null;
            
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
       
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
      HttpSession session ; 
      HttpServletRequest httprequest = (HttpServletRequest)request;
      session = httprequest.getSession(false);
      System.out.print(session);
      boolean auth = false;
      
      PrintWriter out = response.getWriter();
      response.setContentType("text/HTML");
      
      
      if(session!=null)
      {
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
                System.out.println("Error occured while opening database : "+e);
            }
            
           Statement st;
            int id;
            try
            {
                st=cn.createStatement();
                String sql="SELECT user_name FROM connected_users WHERE session_id = '"+ session.getId() +"'";
                        ResultSet rs=st.executeQuery(sql);
                       // out.print("rs "+rs);
                        if(rs.next())
                        {
                            //chain.doFilter(request, response);
                            auth = true;
                        }else
                        {                           
                           out.println("<!DocType html> <html> <head> <title> </title> </head> <body> Access Denined Please logIn to Connect </body> </html>");
                        }
                        
                        rs.close();
                        st.close();
                        cn.close();
                    }catch(Exception e)
                    {
                        System.out.print("\nError retriving data from database : "+e);
                    }
      }else
      {
          //((HttpServletResponse)response).sendRedirect("login.jsp");
      }
      
      //System.out.print("session id"+session.getId());
      if(auth)
        chain.doFilter(request, response);
      else
      {
          ((HttpServletResponse)response ).sendRedirect("Error-need-authentication.html");
      }
    }

    @Override
    public void destroy() {
       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
