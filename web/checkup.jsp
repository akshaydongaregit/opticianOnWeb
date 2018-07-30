

<%-- 
    Document   : checkup.jsp
    Created on : Oct 14, 2017, 8:23:37 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>	OptoSoft-Patient Checkup </title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/checkup.css">
        
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
    <body >
        <%@include file="master/user-selector.jsp" %>
	<!-- Header / Software Name-->
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

        
	<!-- Checkup Form -->
	<form class="form" valid="all-filled">
            
            
        <%@ page import="java.sql.*" %>
        <%@page import="java.util.*" %>
        
        <%
            //System.out.print("parsing the request...");
            String action = request.getParameter("action");
            String patientName,mobileNo,opticianName,patientId,address="",gender="",e_mail="",dob="",arrival_date,RE_D_SPH,RE_D_CYL,LE_D_AXIS,LE_D_VA,RE_N_SPH,RE_N_CYL,LE_N_AXIS,LE_N_VA;
            String user=username;
            
                today=""+new java.sql.Date(new java.util.Date().getTime());
                 
                patientName = request.getParameter("txtpatientname"); 
                mobileNo = request.getParameter("txtcontactno");
                patientId = request.getParameter("txtpatientid");
                opticianName = request.getParameter("txtopticianname");
                address = request.getParameter("address");
                gender = request.getParameter("gender");
                dob = request.getParameter("dob");
                e_mail = request.getParameter("e_mail");
                arrival_date = request.getParameter("arrival_date");
                
                RE_D_SPH = request.getParameter("RE_D_SPH");
                RE_D_CYL = request.getParameter("RE_D_CYL");
                LE_D_AXIS = request.getParameter("LE_D_AXIS");
                LE_D_VA = request.getParameter("LE_D_VA");
                
                RE_N_SPH = request.getParameter("RE_N_SPH");
                RE_N_CYL = request.getParameter("RE_N_CYL");
                LE_N_AXIS = request.getParameter("LE_N_AXIS");
                LE_N_VA = request.getParameter("LE_N_VA"); 
                
                 
            //String username = request.getParameter("txtusername");
            //System.out.print("\n request is parsed ");
            
            
                boolean added = false;
                
                
            if( action!=null && !action.equalsIgnoreCase("") && action.equalsIgnoreCase("save") )
            {
                

                //insert values
                
                try
                {
                    st=cn.createStatement();

                    String sql="INSERT INTO checkup_info (patient_name,patient_id,dob,gender,address,contact_no,e_mail,arrival_date,RE_D_SPH,RE_D_CYL,RE_N_SPH,RE_N_CYL,LE_D_AXIS,LE_D_VA,LE_N_AXIS,LE_N_VA,checkup_date,optician) "
                        + " VALUES ('"+patientName+"','"+patientId+"','"+dob+"','"+gender+"','"+address+"','"+mobileNo+"','"+e_mail+"','"+arrival_date+"','"+RE_D_SPH+"','"+RE_D_CYL+"','"+RE_N_SPH+"','"+RE_N_CYL +"','"+LE_D_AXIS+"','"+LE_D_VA+"','"+LE_N_AXIS+"','"+LE_N_VA+"','"+today+"','"+opticianName+"')";

                    st.executeUpdate(sql);
                    added = true;
                    
                    //setting checked field of patients table
                    sql="update patients set checked=1 where id='"+patientId+"'";
                    st.executeUpdate(sql);
                    
                }catch(Exception e)
                {
                     out.print("<script type=\"text/javascript\"> alert(\"Error occured while writing to database database "+e+"\"); </script>");
                     added=false;
                }
                if(added)
                {
                    out.print("<script type=\"text/javascript\"> alert(\"Checkup information added successfully\") </script>");
                }
            }else if(action!=null && action.equalsIgnoreCase("generate"))
            {
                
            }
            
            String openfor=request.getParameter("for");
            String pname="",con_no="",p_id="";address="";gender="";e_mail="";dob="";arrival_date="";String user_name="";
            
           if(openfor!=null)
            {
                p_id=openfor;
                
                        try
                        {
                            st=cn.createStatement();
 
                            String sql="SELECT name,dob,contact_no,address,gender,e_mail,arrival,user_name FROM patients where id = "+openfor ;

                            ResultSet rs=st.executeQuery(sql);
                            if(!rs.first())
                            {
                                out.print("<script type=\"text/javascript\"> alert(\"Oops it seem's like record is not available for id \"); </script>");
                            }else
                            {
                                pname  = rs.getString("name");
                                con_no = ""+rs.getBigDecimal("contact_no");
                                address=rs.getString("address");
                                gender = rs.getString("gender");
                                e_mail = rs.getString("e_mail");
                                dob =""+rs.getDate("dob");
                                arrival_date = ""+rs.getString("arrival");
                                user_name = ""+rs.getString("user_name");
                            }
                            
                        }catch(Exception e)
                        {
                            out.print("<script type=\"text/javascript\"> alert(\"Error occured while reading from database "+e+"\"); </script>");    
                        }
            }
        %>
		<div class="section-label">
			<label class="section-label" name="patient-info"> Patient Information </label>
		</div>
		<label> Patient Name </label> 
		<input type="text" class ="input input-text" value = "<%= pname %>" name="txtpatientname" valid="char" style="margin:10px;">
		<label> Optician Name </label> 
		<input type="text" class ="input input-text" value = "<%= user_name %>" name="txtopticianname" valid="char" style="margin:10px;"> <br/>
		<label> Patient Id </label> 
		<input type="text" class ="input input-text" value = "<%= p_id %>" name="txtpatientid"  style="margin:10px;">
		<label> Contact No </label> 
		<input type="text" class ="input input-text" value = "<%= con_no %>" name="txtcontactno" valid= "number" style="margin:10px;"> <br/>
                <input type="hidden" value = "<%= address %>" name="address" >
                <input type="hidden" value="<%= gender %>" name="gender">
                <input type="hidden" value="<%= e_mail %>" name="e_mail">
                <input type="hidden" value="<%= dob %>" name="dob">
                <input type="hidden" value="<%= arrival_date %>" name="arrival_date">
                <input type="hidden" value="<%= request.getParameter("age") %>" name="age">
		<div class="section-label"> 
			<label class="section-label"> Checkup Information </label> 
		</div>

		<div class="table">
			<table class="table">
				
					<tr class="table-row">
						<td class="table-head" > </td>
						<td colspan=2 class="table-head" > Right Eye </td>
						<td colspan=2 class="table-head" > Left Eye </td>
					</tr>
				
					<tr class="table-row">
						<td> </td>
						<td> SPH </td>
						<td> CYL </td>
						<td> AXIS </td>
						<td> VA </td>
					</tr>
				
					<tr class="table-row">
						<td> Distance</td>
						<td> <input type="text" class ="input input-text" name="RE_D_SPH" style="margin:10px;" value="0.0"> </td>
						<td> <input type="text" class ="input input-text" name="RE_D_CYL" style="margin:10px;" value="0.0"> </td>
						<td> <input type="text" class ="input input-text" name="LE_D_AXIS" style="margin:10px;" value="0.0"> </td>
						<td> <input type="text" class ="input input-text" name="LE_D_VA" style="margin:10px;" value="0.0"> </td>
					</tr>
				
					<tr class="table-row">
						<td> Near</td>
						<td> <input type="text" class ="input input-text" name="RE_N_SPH" style="margin:10px;" value="0.0"> </td>
						<td> <input type="text" class ="input input-text" name="RE_N_CYL" style="margin:10px;" value="0.0"> </td>
						<td> <input type="text" class ="input input-text" name="LE_N_AXIS" style="margin:10px;" value="0.0"> </td>
						<td> <input type="text" class ="input input-text" name="LE_N_VA" style="margin:10px;" value="0.0"> </td>
					</tr>
			
			</table>
		</div>
		<input type="submit" class="btn btn-purple" value="Save" onclick="handle_action('save');">
                <input type="submit" class="btn btn-purple" value="Generate Prescription" style="width:25%" formaction="generate-prescription.jsp" onclick="handle_action('generate');">
                <input type="hidden" name="action"  value="" >
	</form>
        <%@include file="master/userpanel.jsp" %>
        <script type="text/javascript" src="js/validation-common.js"></script>
        <script type="text/javascript" src="js/form-common.js"></script>
    </body>
</html>