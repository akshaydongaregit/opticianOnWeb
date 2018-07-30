<%-- 
    Document   : patient
    Created on : Oct 16, 2017, 12:52:36 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OptoSoft patient-info</title>
        <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/patient.css"> 
        <script type="text/javascript">
            function handle_action(actionval)
            {
                var action=document.getElementsByName("action");
                action = action.item(0);
                action.value = ""+actionval;
                //alert("value changed");
            }
            function handle_checkup()
            {
                var id= document.getElementById("txtid").value;
                var age= document.getElementById("txtage").value;
                window.location="checkup.jsp?for="+id+"&age="+age;
            }
        </script>
    </head>
    <body >
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

        <form class="form" valid="all-filled">
            
            <!--  Parse request and generate form   -->
            
            <%
                String action = request.getParameter("action");
                String id=request.getParameter("id");
                
                if(action!=null && action.equalsIgnoreCase("view") && id!=null)
                {
                   
                        try
                        {
                            st=cn.createStatement();
 
                            String sql="SELECT name,id,dob,gender,address,contact_no,e_mail FROM patients where id = "+id ;

                            ResultSet rs=st.executeQuery(sql);
                            if(!rs.first())
                            {
                                out.print("<script type=\"text/javascript\"> alert(\"Oops it seem's like record is not available for id \"); </script>");
                            }else
                            {
                                String age = request.getParameter("age");
                                
                                out.print(""
                                +"<label> Patient Name </label>" 
                                +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getString("name")+"\" name=\"txtname\" id=\"txtname\" valid=\"char\" style=\"margin:10px;\">"
                                +"<label> Id </label>" 
                                +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getInt("id")+"\" name=\"txtid\" id=\"txtid\" style=\"margin:10px;\" > <br/>"
                                +"<label> Date Of Birth </label>" 
                                +"<input type=\"date\" class =\"input input-text\" value = \""+rs.getDate("dob")+"\" name=\"txtdob\" style=\"margin:20px;\">" 
                                +"<label> Age </label>" 
                                +"<input type=\"text\" class =\"input input-text\" value = "+age+" name=\"txtage\" id=\"txtage\" style=\"margin:20px;\" valid=\"number\" > <br/>"
                                +"<label> Gender </label>" );
                                
                                String gender=rs.getString("gender");
                                %>
                                
                                <input type="radio" class="radio radio-purple" name="radio-gender" value="male" <%  if(gender.equalsIgnoreCase("male")){out.print("checked = \"checked\"");} %> > <label id="lbl-male">Male</label>
                                <input type="radio" class="radio radio-purple" name="radio-gender" value="female" <%  if(gender.equalsIgnoreCase("female")){out.print("checked = \"checked\"");} %> > <label id="lbl-female">Female</label> <br/>
                                
                                <%
                                out.print(""
                                +"<label> Address </label>" 
                                +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getString("address")+"\" name=\"txtaddress\" style=\"margin:20px;\"> <br/>"
                                +"<label> Mobile no </label>" 
                                +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getBigDecimal("contact_no")+"\" name=\"txtmobileno\" style=\"margin:20px;\" valid=\"number\" maxlength=\"10\">"
                                +"<label> E-Mail </label>" 
                                +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getString("e_mail")+"\" name=\"txtemail\" style=\"margin:20px;\" valid=\"email\" > <br/>");
                                
                            }
                        }catch(Exception e)
                        {
                            out.print("<script type=\"text/javascript\"> alert(\"Error occured while reading from database "+e+"\"); </script>");    
                        }
                                                    
                }
                
                if(action!=null && action.equalsIgnoreCase("save"))
                {
                    //parse request
                    String name,dob,gender,address,mobileno,email;
                        name = request.getParameter("txtname");
                        id = request.getParameter("txtid");
                        dob = request.getParameter("txtdob");
                        gender = request.getParameter("radio-gender");
                        address = request.getParameter("txtaddress");
                        mobileno = request.getParameter("txtmobileno");
                        email = request.getParameter("txtemail");
                        
                        if(name!=null && dob!=null && gender!=null && address!=null && mobileno!=null &&email!=null)
                        {

                            //insert values

                            try
                            {
                                st=cn.createStatement();

                                String sql="update patients set name = '"+name+"',dob = '"+dob+"', gender = '"+gender+"', address = '"+address+"', contact_no = '"+mobileno+"',e_mail = '"+email+"' where id = "+id;
                                st.executeUpdate(sql);
                                out.print("<script type=\"text/javascript\"> alert(\"Record saved successfully \"); </script>");
                            }catch(Exception e)
                            {
                                 out.print("<script type=\"text/javascript\"> alert(\"Error occured while writing to database database "+e+"\"); </script>");

                            }
                            out.print("<script type=\"text/javascript\"> window.location=\"patient.jsp?action=view&id="+id+"\" </script>");
                        }else
                        {
                            out.print("<script type=\"text/javascript\"> alert(\"please fill all fields \"); </script>");
                        }
                }

            %>
            
            <!--
		<label> Patient Name </label> 
		<input type="text" class ="input input-text" name="txtname" id="txtname" valid="char" style="margin:10px;">
		<label> Id </label> 
		<input type="text" class ="input input-text" name="txtid" id="txtid" style="margin:10px;" > <br/>
		
                <label> Date Of Birth </label> 
		<input type="text" class ="input input-text" name="txtdob" style="margin:20px;"> 
		<label> Age </label> 
		<input type="text" class ="input input-text" name="txtage" style="margin:20px;" valid="number" > <br/>
		<label> Gender </label> 
		<input type="text" class ="input input-text" name="txtgender" style="margin:20px;"> <br/>
		<label> Address </label> 
		<input type="text" class ="input input-text" name="txtaddress" style="margin:20px;"> <br/>
		<label> Mobile no </label> 
		<input type="text" class ="input input-text" name="txtmobileno" style="margin:20px;" valid="number" maxlength="10">
		<label> E-Mail </label> 
		<input type="text" class ="input input-text" name="txtemail" style="margin:20px;"> <br/>
            -->
            
            <input type="hidden" name="action" value="" />
		<input type="submit" class="btn btn-purple" value="Save" onclick="handle_action('save');">
		<input type="button" class="btn btn-purple" value="Check Up" onclick="handle_checkup();">
	</form>
    </body>
    <%@include file="master/userpanel.jsp" %>
    <script type="text/javascript" src="js/validation-common.js"></script>
</html>
