/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author DONGRE
 */
public class PatientHandler extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PatientHandler</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String action = request.getParameter("action");
            out.print(action);
            
            /*Connect to database*/
            String SQL_DRIVER="com.mysql.jdbc.Driver";
            String SQL_URL="jdbc:mysql://localhost:3306/optosoft";
            Connection cn=null;
            
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
            
            if(action!=null && action.equalsIgnoreCase("delete"))
            {
                String id = request.getParameter("id");
                id=id.substring(1);
              
                out.print("Deleting patient for id:"+id+" ...");
                
                Statement st=null;
                try
                {
                    st=cn.createStatement();
                    String sql="delete from patients where id = "+id;
                    int aff=st.executeUpdate(sql);
                    if(aff>0)
                    {
                        out.print("<script type=\"text/javascript\"> alert(\"Patient Information removed successfully \"); </script>");
                    }else
                    {
                        out.print("<script type=\"text/javascript\"> alert(\"can't delete patient record); </script>");
                    }
                }catch(Exception e)
                {
                    e.printStackTrace();
                    return;
                }
                
            }
            if(action!=null && action.equalsIgnoreCase("clearhistory"))
            {
                String id = request.getParameter("id");
                id=id.substring(1);
              
                out.print("Deleting patient history for id:"+id+" ...");
                
                Statement st=null;
                try
                {
                    st=cn.createStatement();
                    String sql="delete from checkup_info where patient_id = "+id;
                    int aff=st.executeUpdate(sql);
                    if(aff>0)
                    {
                        out.print("<script type=\"text/javascript\"> alert(\"Patient Information removed successfully \"); </script>");
                    }else
                    {
                        out.print("<script type=\"text/javascript\"> alert(\"can't delete patient record); </script>");
                    }
                }catch(Exception e)
                {
                    e.printStackTrace();
                    return;
                }
            }
            
            //redirect to requesting page.
            String from = request.getParameter("from");
            if(from!=null && !from.equalsIgnoreCase(""))
            {
                out.print("Redirecting to "+from+" ...");
                //response.sendRedirect(from);
                out.print("<script type=\"text/javascript\"> window.location = \""+from+"\" </script>");
            }
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
