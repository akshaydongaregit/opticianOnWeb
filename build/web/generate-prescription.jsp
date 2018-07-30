<%-- 
    Document   : generate-prescription
    Created on : Oct 16, 2017, 5:56:41 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>	OptoSoft - generate prescription </title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/generate-prescription.css"> 
</head>
<body>
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

        <% 
            /*
            
            java.util.Date dob = request.getDate("dob");
           int age = tDate.getYear()-dob.getYear(); */
        %>
                   
	<!-- Checkup Form -->
        <form class="form" action="prescription.jsp" method="GET" >
		<div class="table">
                    
                    <label> Patient Id </label> 
                    <input type="text" class ="input input-text" value = "<%= request.getParameter("txtpatientid") %>" name="txtpatientid"  style="margin:10px;"> <br>
                    
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
						<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("RE_D_SPH") %>" name="RE_D_SPH" style="margin:10px;"> </td>
						<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("RE_D_CYL") %>" name="RE_D_CYL" style="margin:10px;"> </td>
						<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("LE_D_AXIS") %>" name="LE_D_AXIS" style="margin:10px;"> </td>
						<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("LE_D_VA") %>" name="LE_D_VA" style="margin:10px;"> </td>
					</tr>
				
					<tr class="table-row">
						<td> Near</td>
						<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("RE_N_SPH") %>" name="RE_N_SPH" style="margin:10px;"> </td>
						<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("RE_N_CYL") %>" name="RE_N_CYL" style="margin:10px;"> </td>
						<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("LE_N_AXIS") %>" name="LE_N_AXIS" style="margin:10px;"> </td>
						<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("LE_N_VA") %>" name="LE_N_VA" style="margin:10px;"> </td>
					</tr>
			</table>
		</div>
		
		 <input type="radio" class="radio radio-purple" name="useconst" > <label>Constant use</label>
		 <input type="radio" class="radio radio-purple" name="nearwork" > <label>Near work</label>
		 <input type="radio" class="radio radio-purple" name="distance" > <label>Distance</label> <br>
		<label> Bifocal </label> 
		<input type="text" class ="input input-text" name="txtbifocal" style="margin:10px;">
		<label> Shade </label> 
		<!--<select>
			<option>Gray</option>
			<option>Blue</option>
		</select>
		-->
		<input type="text" class ="input input-text" name="txtshade" style="margin:10px;"> <br>
		<label> Name </label> 
		<input type="text" value = "<%= request.getParameter("txtpatientname") %>" class ="input input-text" name="txtpatientname" style="margin:10px;">
		<label> Age </label> 
                <input type="text" class ="input input-text" name="txtage" style="margin:10px;" value="<%= request.getParameter("age") %>" > <br>
		<label> Address </label> 
		<input type="text" class ="input input-text" value = "<%= request.getParameter("address") %>" name="txtaddress" style="margin:10px;">
		<label> Mobile </label> 
		<input type="text" class ="input input-text" value = "<%= request.getParameter("txtcontactno") %>" name="txtcontactno" style="margin:10px;"> <br>
		<label> Instructions </label> 
		<input type="text" class ="input input-text" name="txtinstructions" style="margin:10px;"> <br>
                
		<input type="submit" class="btn btn-purple" value="Generate" style="width:25%" >
	</form>
                
                <%@include file="master/userpanel.jsp" %>
</body>
</html>
