<%-- 
    Document   : add-user
    Created on : Oct 14, 2017, 4:28:37 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
    </head>
    <body>
        
        Full Name:
        <% request.getParameter("txtname"); %>
        Date of Birth:
        <% request.getParameter("txtdob"); %>
        Address:
        <% request.getParameter("txtaddress"); %>
        Mobile No
        <% request.getParameter("txtmobileno"); %>
        E-Mail
        <% request.getParameter("txtemail"); %>
        User Name
        <% request.getParameter("txtusername"); %>
        Password
        <% request.getParameter("txtpassword"); %>
        
        <%@ page import="java.sql.*" %>
        <%@page import="java.util.*" %>
        
        <!--getting values -->
        <%
            String fullname = request.getParameter("txtname"); 
            String dob = request.getParameter("txtdob"); 
            String gender="";
            String address = request.getParameter("txtaddress"); 
            String contact_no = request.getParameter("txtmobileno");
            String e_mail = request.getParameter("txtemail");
            String username = request.getParameter("txtusername");
            String password = request.getParameter("txtpassword");
            String conf_password= request.getParameter("txtconfpassword");
            
            //database connection
            out.print("connecting...");
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
                out.print("\n connection successfull ");
            }catch(Exception e)
            {
                out.println("Error occured while opening database : "+e);
            }
              
            //insert values
            Statement st;
            try
            {
                st=cn.createStatement();
                
                String sql="INSERT INTO users (full_name,dob,gender,address,contact_number,e_mail,user_name,password) "
                        + " VALUES ('"+fullname+"','"+dob+"','"+gender+"','"+address+"','"+contact_no+"','"+e_mail+"','"+username+"','"+password+"')";
                
                st.executeUpdate(sql);
                out.print("\nUser Added Successfully");
            }catch(Exception e)
            {
                out.print(e);
            }
            
        %>
        
        
        <!-- <js:forward page="login.jsp"/> -->
    </body>
</html>
