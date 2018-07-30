/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DONGRE
 */
public class AddUser extends HttpServlet {

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
        
        /*extract values from request */
        String full_name=request.getParameter("txtname");
        String dob=request.getParameter("txtdob");
        String gender="";
        String address=request.getParameter("txtaddress");
        String contact_no=request.getParameter("txtmobileno");
        String e_mail=request.getParameter("txtemail");
        String username=request.getParameter("txtusername");
        String password=request.getParameter("txtpassword");
      
        String ConnectionResult="";
        String SQL_DRIVER="com.mysql.jdbc.Driver";
        String SQL_URL="jdbc:mysql://localhost:3306/optosoft";
        Connection cn=null;
            /*----------------------
            connection to database
            --------------------------*/
                     
            try
            {
                Class.forName(SQL_DRIVER);
                cn=DriverManager.getConnection(SQL_URL,"root","rivendell");
                ConnectionResult = "\n connection successfull ";
            }catch(Exception e)
            {
                ConnectionResult = "Error occured while opening database : "+e;
            }
        //insert values
        //insert values
            Statement st;
            try
            {
                st=cn.createStatement();
                
                String sql="INSERT INTO users (full_name,dob,gender,address,contact_number,e_mail,user_name,password) "
                        + " VALUES ('"+full_name+"','"+dob+"','"+gender+"','"+address+"','"+contact_no+"','"+e_mail+"','"+username+"','"+password+"')";
                
                st.executeUpdate(sql);
                ConnectionResult = "\nUser Added Successfully";
            }catch(Exception e)
            {
                ConnectionResult = ""+e;
            }
            
        
        
        //Give Responce
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUser</title>");            
            out.println("</head>");
            out.println("<body>");
            
            /*
            out.println("Full Name : "+full_name);
            out.println("date of birth : "+dob);
            out.println("Gender : "+gender);
            out.println("Address : "+address);
            out.println("Mobile no : "+contact_no);
            out.println("E-Mail : "+e_mail);
            out.println("User name : "+username);
            out.println("password : "+password);
            */
            
            out.print(ConnectionResult);
            out.print("<script type=\"text/javascript\"> alert(\""+ConnectionResult+"\"); </script>");
            out.println("</body>");
            out.println("</html>");
            response.sendRedirect("login.jsp");
        }catch(Exception e)
        {
            
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
