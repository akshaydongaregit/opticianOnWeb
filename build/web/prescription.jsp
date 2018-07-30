<%-- 
    Document   : prescription
    Created on : Oct 16, 2017, 6:16:54 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>	OptoSoft - Prescription </title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/generate-prescription.css"> 
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

        <%
            if(request.getParameter("action")!=null)
            {
                String p_id=request.getParameter("txtpatientid");
                int const_use=request.getParameter("constuse")!=null?1:0;
                int near_work=request.getParameter("nearwork")!=null?1:0;
                int distance=request.getParameter("distance")!=null?1:0;
                String bifocal=request.getParameter("txtbifocal");
                String shade=request.getParameter("txtshade");
                String instruc=request.getParameter("txtinstructions");
                
                try
                {
                    st=cn.createStatement();

                    String sql="INSERT INTO prescriptions (p_id,const_use,near_work,distance,bifocal,shade,instructions,cdate) "
                            + " VALUES ('"+p_id+"','"+const_use+"','"+near_work+"','"+distance+"','"+bifocal+"','"+shade+"','"+instruc+"','"+today+"')";
                    st.executeUpdate(sql);
                    
                     out.print("<script type=\"text/javascript\"> alert(\"Prescription saved successfully\") </script>");
                }catch(Exception e)
                {
                     out.print("<script type=\"text/javascript\"> alert(\"Error occured while writing to database "+e+"\"); </script>");
                   
                }
            }
        %>
	<!-- Checkup Form -->
	<div class="template">
		<div class="header">
			<label class="title">Ranjan</label> <br>
			<label class="title tip">opticians</label>
		</div>
		<div class="body">
                    <form name="prescription" class="form" action="prescription.jsp">
                        <input type="hidden" name="txtpatientid" value="<%= request.getParameter("txtpatientid") %>"/>
                        <input type="hidden" name="action" value="save"/>
                        
				<label> Patient Id :  </label>
				<label id="lblpatientid"> <%= request.getParameter("txtpatientid") %> </label>
				<label style="float:right;"> Date : <%= today %> </label>
				<label id="lbldate"> </label> <br>
			
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
							<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("RE_D_SPH") %>" name="RE_D_SPH" style="margin:10px;"> </td>
							<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("RE_D_CYL") %>" name="RE_D_CYL" style="margin:10px;"> </td>
							<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("LE_D_AXIS") %>" name="LE_D_AXIS" style="margin:10px;"> </td>
							<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("LE_D_VA") %>" name="LE_D_VA" style="margin:10px;"> </td>
						</tr>
					
						<tr class="table-row">
							<td> Near</td>
							<td> <input type="text" class ="input input-text" name="RE_N_SPH" value = "<%= request.getParameter("RE_N_SPH") %>" style="margin:10px;"> </td>
							<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("RE_N_CYL") %>" name="RE_N_CYL" style="margin:10px;"> </td>
							<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("LE_N_AXIS") %>" name="LE_N_AXIS" style="margin:10px;"> </td>
							<td> <input type="text" class ="input input-text" value = "<%= request.getParameter("LE_N_VA") %>" name="LE_N_VA" style="margin:10px;"> </td>
						</tr>
					</table>
				</div>
                                
                                <% if(request.getParameter("useconst")!=null && request.getParameter("useconst").equalsIgnoreCase("on")) {%>
				<label>&nbsp;&nbsp;Constant use</label> 
                                <% } %>
                                <% if(request.getParameter("nearwork")!=null && request.getParameter("nearwork").equalsIgnoreCase("on")) {%>
				<label>&nbsp;&nbsp;Near Work</label> 
                                <% } %>
				<% if(request.getParameter("distance")!=null && request.getParameter("distance").equalsIgnoreCase("on")) {%>
				<label>&nbsp;&nbsp; Distance</label> 
                                <% } %>
                                <br>
				<label> Bifocal </label> 
				<input type="text" class ="input input-text" value = "<%= request.getParameter("txtbifocal") %>" name="txtbifocal" style="margin:10px;">
				<label> Shade </label> 
				<input type="text" class ="input input-text" value = "<%= request.getParameter("txtshade") %>" name="txtshade" style="margin:10px;"> <br>
				<label> Name </label> 
				<input type="text" class ="input input-text" value = "<%= request.getParameter("txtpatientname") %>" name="txtname" style="margin:10px;">
				<label> Age </label> 
				<input type="text" class ="input input-text" value = "<%= request.getParameter("txtage") %>" name="txtage" style="margin:10px;"> <br>
				<label> Address </label> 
				<input type="text" class ="input input-text" value = "<%= request.getParameter("txtaddress") %>" name="txtaddress" style="margin:10px;">
				<label> Mobile No </label> 
				<input type="text" class ="input input-text" value = "<%= request.getParameter("txtcontactno") %>" name="txtmobile" style="margin:10px;"> <br>
				<label> Instructions </label> 
				<input type="text" class ="input input-text" value = "<%= request.getParameter("txtinstructions") %>" name="txtinstrc" style="margin:10px;">
			</div>

			<div class="footer">
				<label class="logo" > Ranjan </label> <label class="footer info address">Rani Luxmibai Road Gadhinglaj <label>
				<br> <label class="logo tip" > Opticians </label> <label class="footer info contact"> Contact No - 222607  <label> <br>
				<label class="logo tip info" > Compact Lens Clinic </label>
			</div>
		</div>

			<input type="submit" class="btn btn-purple pre-btn" value="Save" style="width:25%;margin-left:20%" >
                        
			<input type="submit" class="btn btn-purple pre-btn" value="Print" style="width:25%" >
		</form>

</body>
</html>
