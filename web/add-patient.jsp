<%-- 
    Document   : add-patient
    Created on : Oct 14, 2017, 8:14:11 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>	OptoSoft-Add Patient  </title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/add-patient.css"> 
    
    </head>
    <body>
        <%@include file="master/user-selector.jsp" %>
        
	<div class="header" >
		<h1 class="title"> Optosoft </h1>
		<h5 class="title-tip"> Assistance to Opticians </h5>
	</div>

	<!-- Menu Bar-->
	<div class="menu">
	<nav class="navbar">
		<ul>
			<li> <a href = "user.jsp" > User </a> </li>
			<li> <a href = "home.jsp" > Home </a> </li>
			<li> <a href = "dispense.jsp" > Dispense </a> </li>
			<li> <a href = "help.jsp" > Help </a> </li>
			<li> <a href = "LogOut" > Log Out </a> </li>
		</ul>
	</nav>
	</div>

        <form class="form" action="add-patient.jsp" valid="all-filled">
		<label> Patient Name </label> 
		<input type="text" class ="input input-text" name="txtname" valid ="char" id="txtname" style="margin:10px;"> <br/>
		<label> Date Of Birth </label> 
		<input type="date" class ="input input-text" name="txtdob" valid = "date" style="margin:20px;"> <br/>
		<!--<label> Age </label> 
		<input type="text" class ="input input-text" name="txtage" style="margin:20px;"> <br/> -->
		<label> Gender </label>
		 <input type="radio" class="radio radio-purple" name="radio-gender" value="male" > <label id="lbl-male">Male</label>
		 <input type="radio" class="radio radio-purple" name="radio-gender" value="female"> <label id="lbl-female">Female</label> <br/>
		<label> Address </label> 
		<input type="text" class ="input input-text" name="txtaddress" style="margin:20px;"> <br/>
		<label> Mobile no </label> 
                <input type="text" class ="input input-text" name="txtmobileno" valid = "number" style="margin:20px;" maxlength="10"> <br/>
		<label> E-Mail </label> 
		<input type="text" class ="input input-text" name="txtemail" style="margin:20px;" valid="email"> <br/>

		<input type="submit" class="btn btn-purple" value="Add Patient" valid="all-filled"> <br/>
	</form>
        
        
       
        <%@page import="java.util.*" %>
        
        <%
            //System.out.print("parsing the request...");
            
            String fullname,dob,age,gender,address,contact_no,e_mail;
            String user=username; 
            
            try
            {
                 fullname = request.getParameter("txtname"); 
                 dob = request.getParameter("txtdob"); 
                 age=request.getParameter("txtage");
                 gender=request.getParameter("radio-gender");
                 address = request.getParameter("txtaddress"); 
                 contact_no = request.getParameter("txtmobileno");
                 e_mail = request.getParameter("txtemail");
            }catch(Exception e)
            {
                //System.out.println("Error occured while parsing");
                return;
            }
            //String username = request.getParameter("txtusername");
            //System.out.print("\n request is parsed ");
            if( fullname!=null && !fullname.equalsIgnoreCase(""))
            { 
                boolean added = false;
                //insert values
                try
                {
                    st=cn.createStatement();

                    String sql="INSERT INTO patients (name,dob,gender,address,contact_no,e_mail,arrival,user_name) "
                            + " VALUES ('"+fullname+"','"+dob+"','"+gender+"','"+address+"','"+contact_no+"','"+e_mail+"','"+today+"','"+user+"')";

                    st.executeUpdate(sql);
                    added = true;
                }catch(Exception e)
                {
                     out.print("<script type=\"text/javascript\"> alert(\"Error occured while writing to database database "+e+"\"); </script>");
                    added=false;
                }
                if(added)
                {
                    out.print("<script type=\"text/javascript\"> alert(\"Patient added successfully\") </script>");
                }
            }
            

        %>
    </body>
    <%@include file="master/userpanel.jsp" %>
    <script type="text/javascript" src="js/validation-common.js"></script>
</html>
