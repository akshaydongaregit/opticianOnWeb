/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DONGRE
 */
public class LogOut extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LogOut</title>");            
            out.println("</head>");
            out.println("<body>");
            String SQL_DRIVER="com.mysql.jdbc.Driver";
            String SQL_URL="jdbc:mysql://localhost:3306/optosoft";
            Connection cn=null;
            /*----------------------
            connection to database
            --------------------------*/
                     
            try
            {
                Class.forName(SQL_DRIVER);
                cn= DriverManager.getConnection(SQL_URL,"root","rivendell");
                //out.print("\n connection successfull ");
            }catch(Exception e)
            {
                out.println("Error occured while opening database : "+e);
            }
              
            
            Statement st;
            try
            {
                st=cn.createStatement();
                
                String sql="delete from connected_users where  session_id = '"+request.getSession(true).getId()+"'";
                
                out.print("logout "+st.executeUpdate(sql));
                response.sendRedirect("login.jsp");
            }catch(Exception e)
            {
                out.print(e);
            }
            //out.println("<h1>Servlet LogOut at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
        }
            
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
