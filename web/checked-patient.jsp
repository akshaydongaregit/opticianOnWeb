<%-- 
    Document   : checked-patient
    Created on : Oct 16, 2017, 10:33:49 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Patient - </title>
        <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/checked-patient.css">
        
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
            
            
        
        <%@page import="java.util.*" %>
        
        <%
            //System.out.print("parsing the request...");
            String action = request.getParameter("action");
            String patientName,mobileNo,opticianName,patientId,checkup_date,address="",gender="",e_mail="",dob="",arrival_date,RE_D_SPH,RE_D_CYL,LE_D_AXIS,LE_D_VA,RE_N_SPH,RE_N_CYL,LE_N_AXIS,LE_N_VA;
            int age=0;
                 
                patientName = request.getParameter("txtpatientname"); 
                mobileNo = request.getParameter("txtcontactno");
                patientId = request.getParameter("txtpatientid");
                opticianName = request.getParameter("txtopticianname");
                address = request.getParameter("txtaddress");
                gender = request.getParameter("radio-gender");
                dob = request.getParameter("txtdob");
             
                e_mail = request.getParameter("txte_mail");
                arrival_date = request.getParameter("txtarrival_date");
                checkup_date = request.getParameter("txtcheckup_date");
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

                    String sql="UPDATE checkup_info SET patient_name='"+patientName+"' , dob = '"+dob+"' , gender = '"+gender+"' , address = '"+address+"' , contact_no = '"+mobileNo+"' , e_mail = '"+e_mail+"' , arrival_date = '"+arrival_date+"' , RE_D_SPH = '"+RE_D_SPH+"' , RE_D_CYL = '"+RE_D_CYL+"' , RE_N_SPH = '"+RE_N_SPH+"' , RE_N_CYL = '"+RE_N_CYL+"', LE_D_AXIS = '"+LE_D_AXIS+"' , LE_D_VA = '"+LE_D_VA+"' , LE_N_AXIS = '"+LE_N_AXIS+"' , LE_N_VA = '"+LE_N_VA+"' , checkup_date = '"+checkup_date+"' , optician = '"+opticianName+"' where patient_id = "+patientId;
                        //+ " VALUES ('"+patientName+"','"+patientId+"','"+dob+"','"+gender+"','"+address+"','"+mobileNo+"','"+e_mail+"','"+arrival_date+"','"+RE_D_SPH+"','"+RE_D_CYL+"','"+RE_N_SPH+"','"+RE_N_CYL +"','"+LE_D_AXIS+"','"+LE_D_VA+"','"+LE_N_AXIS+"','"+LE_N_VA+"','"+checkup_date+"','"+opticianName+"')";

                    int aff = st.executeUpdate(sql);
                    if(aff>0)
                    {
                        out.print("<script type=\"text/javascript\"> alert(\"Patient information saved successfully\") </script>");    
                    }
                }catch(Exception e)
                {
                     out.print("<script type=\"text/javascript\"> alert(\"Error occured while writing to database database "+e+"\"); </script>");
                     added=false;
                }
                
                out.print("<script type=\"text/javascript\"> window.location=\"checked-patient.jsp?action=view&id="+patientId+"\" </script>");
            }else if(action!=null && action.equalsIgnoreCase("view"))
            {
                
                String openid=request.getParameter("id");
                String pname="",con_no="",p_id="";address="";gender="";e_mail="";dob="";arrival_date="";checkup_date="";

               if(openid!=null)
                {
                    p_id = openid;
            
                            try
                            {
                                st=cn.createStatement();

                                String sql="SELECT * FROM checkup_info where patient_id = "+openid ;

                                ResultSet rs=st.executeQuery(sql);
                                if(!rs.first())
                                {
                                    out.print("<script type=\"text/javascript\"> alert(\"Oops it seem's like record is not available for id \"); </script>");
                                }else
                                {
                                    
                                    java.util.Date ddob = rs.getDate("dob");
                                    
                                    age = tDate.getYear()-ddob.getYear();
                                
                                    pname = rs.getString("patient_name"); 
                                    con_no = ""+rs.getBigDecimal("contact_no");
                                    //patientId = rs.getString("patient_id");
                                    opticianName = rs.getString("optician");
                                    address = rs.getString("address");
                                    gender = rs.getString("gender");
                                    dob = ""+rs.getDate("dob");
                                    e_mail = rs.getString("e_mail");
                                    arrival_date = ""+rs.getDate("arrival_date");
                                    checkup_date = ""+rs.getDate("checkup_date");
                                    RE_D_SPH = ""+rs.getFloat("RE_D_SPH");
                                    RE_D_CYL = ""+rs.getFloat("RE_D_CYL");
                                    LE_D_AXIS = ""+rs.getFloat("LE_D_AXIS");
                                    LE_D_VA = ""+rs.getFloat("LE_D_VA");
                                    RE_N_SPH = ""+rs.getFloat("RE_N_SPH");
                                    RE_N_CYL = ""+rs.getFloat("RE_N_CYL");
                                    LE_N_AXIS = ""+rs.getFloat("LE_N_AXIS");
                                    LE_N_VA = ""+rs.getFloat("LE_N_VA"); 
                
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
                
                <label> Patient Id </label> 
		<input type="text" class ="input input-text" value = "<%= p_id %>" name="txtpatientid"  style="margin:10px;">
		<label> Patient Name </label> 
		<input type="text" class ="input input-text" value = "<%= pname %>" name="txtpatientname" valid="char" style="margin:10px;"> <br/>
                <label> Date Of Birth </label> 
                <input type="date" class ="input input-text" value="<%= dob %>" name="txtdob"> 
                <label> Age </label>
                <input type="text" class ="input input-text" value = "<%= age>0?age:"" %>" name="age"> &nbsp;&nbsp;&nbsp;&nbsp;
                <label> Gender </label> 
                 <input type="radio" class="radio radio-purple" name="radio-gender" value="male" <%  if(gender.equalsIgnoreCase("male")){out.print("checked = \"checked\"");} %> > <label id="lbl-male">Male</label>
                 <input type="radio" class="radio radio-purple" name="radio-gender" value="female" <%  if(gender.equalsIgnoreCase("female")){out.print("checked = \"checked\"");} %> > <label id="lbl-female">Female</label> <br/>
                <label> Address </label> 
                <input type="text" class ="input input-text" value = "<%= address %>" name="txtaddress" > <br/>
		<label> Contact No </label> 
                <input type="text" class ="input input-text" value = "<%= con_no %>" name="txtcontactno" valid= "number" style="margin:10px;">
                <label> E-Mail </label> 
                <input type="text" class ="input input-text" value="<%= e_mail %>" name="txte_mail" valid="email"> <br/>
                <label> Date Of Arrival </label> 
                <input type="date" class ="input input-text" value="<%= arrival_date %>" name="txtarrival_date">
                <label> Date Of Checkup </label> 
                <input type="date" class ="input input-text" value="<%= checkup_date %>" name="txtcheckup_date">
                <label> Optician Name </label> 
                <input type="text" class ="input input-text" value="<%= opticianName %>" name="txtopticianname" valid="char" style="margin:10px;"> <br/>
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
						<td> <input type="text" class ="input input-text" value="<%= RE_D_SPH %>" name="RE_D_SPH" style="margin:10px;"> </td>
						<td> <input type="text" class ="input input-text" value="<%= RE_D_CYL %>" name="RE_D_CYL" style="margin:10px;"> </td>
						<td> <input type="text" class ="input input-text" value="<%= LE_D_AXIS %>" name="LE_D_AXIS" style="margin:10px;"> </td>
						<td> <input type="text" class ="input input-text" value="<%= LE_D_VA %>" name="LE_D_VA" style="margin:10px;"> </td>
					</tr>
				
					<tr class="table-row">
						<td> Near</td>
						<td> <input type="text" class ="input input-text" value="<%= RE_N_SPH %>" name="RE_N_SPH" style="margin:10px;"> </td>
						<td> <input type="text" class ="input input-text" value="<%= RE_N_CYL %>" name="RE_N_CYL" style="margin:10px;"> </td>
						<td> <input type="text" class ="input input-text" value="<%= LE_N_AXIS %>" name="LE_N_AXIS" style="margin:10px;"> </td>
						<td> <input type="text" class ="input input-text" value="<%= LE_N_VA %>" name="LE_N_VA" style="margin:10px;"> </td>
					</tr>
                            
			</table>
		</div>
                
                
                <%  }   %>
		<input type="submit" class="btn btn-purple" value="Save" onclick="handle_action('save');">
                
                <input type="hidden" name="action"  value="" >
	</form>
        <%@include file="master/userpanel.jsp" %>
        <script type="text/javascript" src="js/validation-common.js"></script>
    </body>
</html>
