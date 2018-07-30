<%-- 
    Document   : user
    Created on : Dec 10, 2017, 7:07:59 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Optosoft - User</title>
        <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/user.css">
        <script type="text/javascript">
            function handle_action(actionval)
            {
                var action=document.getElementsByName("action");
                action = action.item(0);
                action.value = ""+actionval;
                //alert("value changed");
            }
        </script>
    </head>
    <body>
        <%-- Database connectivity--%>
        <%@page import="java.sql.*" %>
        <%
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
             
             String action = request.getParameter("action");
             String uname="",fname="",dob="",gender="",address="",mobileno="",email="";

             if(action!=null)
             {
                 if(action.equalsIgnoreCase("save"))
                 {
                     uname = request.getParameter("txtusername");
                     fname = request.getParameter("txtfullname");
                     dob= request.getParameter("txtdob");
                     gender = request.getParameter("radio-gender");
                     address = request.getParameter("txtaddress");
                     mobileno = request.getParameter("txtmobileno");
                     email = request.getParameter("txtemail");
                     
                     if(uname!=null )
                     {
                         try
                        {
                            st=cn.createStatement();

                            String sql="update users set full_name = '"+fname+"', dob = '"+dob+"' , gender = '"+gender+"' , address = '"+address+"', contact_number = '"+mobileno+"', e_mail = '"+email+"' where user_name ='"+username+"'";
                            st.executeUpdate(sql);
                            out.print("<script type=\"text/javascript\"> alert(\"Updated successfully \"); </script>");
                        }catch(Exception e)
                        {
                            out.print("<script type=\"text/javascript\"> alert(\"Oops!  Error ocurred while updating database \"); </script>");
                            e.printStackTrace();
                        }
                     }
                 }
             }
             
            try
            {
                st=cn.createStatement();

                String sql="SELECT * FROM users where user_name = '"+username+"'" ;

                ResultSet rs=st.executeQuery(sql);
                if(!rs.first())
                {
                    out.print("<script type=\"text/javascript\"> alert(\"Oops it seem's like record is not available for id \"); </script>");
                }else
                {
                     uname = rs.getString("user_name");
                     fname = rs.getString("full_name");
                     dob=""+ rs.getDate("dob");
                     gender = rs.getString("gender");
                     address = rs.getString("address");
                     mobileno = ""+rs.getBigDecimal("contact_number");
                     email = rs.getString("e_mail");
                    
                }
            }catch(Exception e)
            {

            }
            
            if(action!=null)
                if(action.equalsIgnoreCase("changepassword"))
                {
                    String cpass = request.getParameter("txtcpass");
                    String npass = request.getParameter("txtnpass");
                    String ncpass = request.getParameter("txtncpass");
                    if(cpass!=null && npass!=null && ncpass!=null)
                    {
                        if(!cpass.equals(password)){
                            %> <script type="text/javascript"> alert("password doesn't match"); </script> <%
                        }else if(!npass.equals(ncpass))
                        {
                            %> <script type="text/javascript"> alert("confirm password didn't match"); </script> <%
                        }
                         else
                            try
                            {
                                st = cn.createStatement();
                                String sql = "update users set password = '"+npass+"' where user_name = '"+username+"'";
                                st.execute(sql);
                                sql = "update connected_users set user_password = '"+npass+"' where user_name = '"+username+"'";
                                st.execute(sql);
                                %> <script type="text/javascript"> alert("password changed successfully"); </script> <%
                            }catch(Exception e)
                            {
                                   %> <script type="text/javascript"> alert("can't change password"); </script> <%
                            }
                    }
        %>
        
        <div class="nav-pane">
            <a href="home.jsp"> <img src="" class="img"> </a>
        <a href="LogOut"> <img src="css/img/logout.png" class="img"> </a>
        </div>
        
        <form name="passwordForm" class="form" action="user.jsp" valid="all-filled">
            <label> Current Password </label> 
            <input type="password" class ="input input-text" name="txtcpass" id="txtpswd"  style="margin:10px;" > <br/>
            <label> New Password </label> 
            <input type="password" class ="input input-text" name="txtnpass" id="txtnpaswd" style="margin:10px;"> <br/>
            <label> Confirm Password </label> 
            <input type="password" class ="input input-text" name="txtncpass"  id="txtncpswd" style="margin:20px;"> <br/>
            <input type="submit" class="btn btn-purple" value="Change">
            <input type="hidden" name="action"  value="changepassword">
        </form>
        <%
                }
                if(action==null || !action.equalsIgnoreCase("changepassword"))
                {
        %>
                    <form name="userForm" class="form" valid="all-filled">
                    <label> User Name </label> 
                    <input type="text" class ="input input-text" name="txtusername" id="txtid" value = "<%= uname%>" style="margin:10px;" > <br/>
                    <label> Full Name </label> 
                    <input type="text" class ="input input-text" name="txtfullname" id="txtname" value = "<%= fname%>" valid="char" style="margin:10px;">
                    <label> Date Of Birth </label> 
                    <input type="date" class ="input input-text" name="txtdob" value = "<%= dob%>" style="margin:20px;"> 
                    <label> Gender </label>                   
                    <input type="radio" class="radio radio-purple" name="radio-gender" value="male" <%  if(gender.equalsIgnoreCase("male")){out.print("checked = \"checked\"");} %> > <label id="lbl-male">Male</label>
                    <input type="radio" class="radio radio-purple" name="radio-gender" value="female" <%  if(gender.equalsIgnoreCase("female")){out.print("checked = \"checked\"");} %> > <label id="lbl-female">Female</label> <br/>
                    <label> Address </label> 
                    <input type="text" class ="input input-text" name="txtaddress" value = "<%= address%>" style="margin:20px;"> <br/>
                    <label> Mobile no </label> 
                    <input type="text" class ="input input-text" name="txtmobileno" value = "<%= mobileno%>" style="margin:20px;" valid="number" maxlength="10">
                    <label> E-Mail </label> 
                    <input type="text" class ="input input-text" name="txtemail" value = "<%= email%>" style="margin:20px;" valid="email"> <br/>
                    <input type="hidden" name="action" value="" />
                    <input type="submit" class="btn btn-purple" value="Save" onclick="handle_action('save');">
                    <input type="submit" class="btn btn-purple" value="Change Password" onclick="handle_action('changepassword');">
                    </form>
                    
        <%      }
        %>
    </body>
    <script type="text/javascript" src="js/validation-common.js"></script>
</html>
