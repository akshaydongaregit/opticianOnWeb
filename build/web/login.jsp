<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>	OptoSoft-LogIn  </title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/login.css"> 
    </head>
    <body>
        <div class="header" >
		<h1 class="title"> Optosoft </h1>
		<h5 class="title-tip"> Assistance to Opticians </h5>
	</div>
	<form class="form">
		<label> User Name </label> 
		<input type="text" class ="input input-text" name="txtusername" style="margin:10px;"> <br/>
		<label> Password </label> 
		<input type="password" class ="input input-text" name="txtpassword" style="margin:20px;"> <br/>
		<input type="submit" class="btn btn-purple" value="Log In"> <br/>
                <a href="signup.jsp"> <input type="button" class="btn btn-purple" value="Sign Up"> </a> <br/>
                <a href="forget.jsp"> <label class="lbl-forget"> Forget Password ?</label> </a>
	</form>
        
        <%@page import="java.sql.*" %>
        
        <%
            String username=request.getParameter("txtusername");
            String password=request.getParameter("txtpassword");
            
            if(username!="" || !username.equalsIgnoreCase(""))
            {
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
              
            //insert values
            Statement st;
            int id;
            try
            {
                st=cn.createStatement();
                String sql="SELECT id FROM users WHERE user_name='"+username+"' AND password='"+password+"'";
                        ResultSet rs=st.executeQuery(sql);
                       // out.print("rs "+rs);
                        if(rs.next())
                        {
                            id=rs.getInt("id");
                            if(id>=0)
                            {
                                //
                                
                                String session_id = session.getId();
                                System.out.print(session_id);
                                sql = "insert into connected_users (user_name,user_password,session_id) values ('"+username+"','"+password+"','"+session_id+"');";
                                st.execute(sql);
                                response.sendRedirect("home.jsp");
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
                        %> <script type="text/javascript" language="javascript"> alert("Error while login"); </script> <%
                    }
            }
         
        %>
         
    </body> 
</html>
