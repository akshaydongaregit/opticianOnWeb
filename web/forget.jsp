<%-- 
    Document   : forget
    Created on : Jan 17, 2018, 2:33:54 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Optosoft - Forget Password</title>
    </head>
    <body>
        
        <%@page import="java.sql.*" %>
        <%@include file="master/email.jsp" %>
        
        <%
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
                //out.print("\n connection successfull ");
            }catch(Exception e)
            {
                out.println("Error occured while opening database : "+e);
            }
            
            String username=request.getParameter("txtusername");
            
            Statement st;
            int id;
            String email;
            
            if(request.getParameter("action").equalsIgnoreCase("init"))
            try
            {
                String from="akshaydongare1797@gmail.com";
                String pswd="akorg17292451";
                
                st=cn.createStatement();
                String sql="SELECT id,e_mail FROM users WHERE user_name='"+username+"'";
                        ResultSet rs=st.executeQuery(sql);
                       //out.print("rs "+rs);
                        if(rs.next())
                        {
                            id=rs.getInt("id");
                            email=rs.getString("e_mail");
                            String ucode= "" + (Math.random()*10000);
                            
                            if(mail(from,pswd,email,"Forget Password","Your id to reset Optosoft Password is : \n "+ucode))
                            {
                                String session_id = session.getId();
                                System.out.print(session_id);
                                sql = "insert into forget(user_id,user_name,user_email,ucode,session_id) values ("+id+"'"+username+"','"+email+"','"+ucode+"','"+session_id+"');";
                                st.execute(sql);
                                response.sendRedirect("forget.jsp?action=promptcode");
                            }else
                            {
                                %> <script type="text/javascript" language="javascript"> alert("Error while Forget Password"); </script> <%
                            }
                        }else
                        {
                            //JOptionPane.showMessageDialog(rootPane,"Unothrised");
                        }
                        
                        rs.close();
                        st.close();
                        cn.close();
                    }catch(Exception e)
                    {
                        out.print("\nError retriving data from database : "+e);
                        %> <script type="text/javascript" language="javascript"> alert("Error while Forget Password"); </script> <%
                    }
                    
                    if(request.getParameter("action").equalsIgnoreCase("promptcode"))
                    {
                        String code=request.getParameter("code");
                        if(code!=null)
                        {
                            response.sendRedirect("forget.jsp?action=reset");
                        }else
                        {
                        %>
                        
                        <form name="promptForm" action="forget.jsp">
                            <div class="notif">
                            <h3> We have been sent reset code to your registered mail </h3>
                            <h3>     Please check your inbox for email</h3>
                            </div>
                            <div class="form">
                                <label> Reset Code </label> 
                                <input type="text" class ="input input-text" name="code" valid="char" style="margin:10px;">
                                <input type="hidden" name="action" value="reset" />
                                <input type="submit" value="Next">
                            </div>
                        </form>
                        <%
                        }
                    }

                    if(request.getParameter("action").equalsIgnoreCase("reset"))
                    {
                        
                        String pswd=request.getParameter("password");
                        String cpswd=request.getParameter("cpassword");
                        
                        if(pswd!=null && cpswd!=null)
                        {
                            String code = request.getParameter("code");
                            
                            try
                            {
                                st=cn.createStatement();
                                String sql="SELECT id FROM forget WHERE ucode='"+code+"'";
                                ResultSet rs=st.executeQuery(sql);
                                if(rs.next())   
                                {
                                    sql = "update users set password='"+pswd+"' where id="+rs.getString("id");
                                    st.executeUpdate(sql);
                                    %>
                                    <h4>Password changed Successfully </h4>
                                    <a href="login.jsp" ><input type="button" value="Go to Login"></a>
                                    <%
                                }
                            }catch(Exception e)
                            {
                                
                            }
                            
                        }else
                        {
                        %>      
                            <form name="resetForm">
                                <label> Enter New Password</label>
                                <input type="password" name="password"> <br>
                                <label> Confirm New Password</label>
                                <input type="password" name="cpassword"> <br>
                                <input type="hidden" name="code" value="<%= request.getParameter("code") %>">
                                <input type="hidden" name="action" value="reset" />
                                <input type="submit" value="Change Password">
                            </form>
                            
                          <%
                        }
                    }
        %>
    </body>
</html>
