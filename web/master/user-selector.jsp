
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
        %>
        <%
            java.util.Date tDate = new java.util.Date();
            String today=""+new java.sql.Date(tDate.getTime());
            %>
 
