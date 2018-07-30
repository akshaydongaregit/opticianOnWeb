<%-- 
    Document   : find-patient
    Created on : Oct 14, 2017, 8:25:11 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>	OptoSoft-Find Patient </title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/find-patient.css"> 
    </head>
    <body >
        <%@include file="master/cdefinit.jsp" %>    
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
	<form class="form">
		<div class="section-label">
			<label class="section-label" name="patient-info"> Patient Information </label>
		</div>
		<label> Patient Name </label> 
		<input type="text" class ="input input-text" name="txtpatientname" valid=char"" style="margin:10px;">
		<label> Optician Name </label> 
		<input type="text" class ="input input-text" name="txtopticianname" valid="char" style="margin:10px;"> <br/>
		<label> Patient Id </label> 
		<input type="text" class ="input input-text" name="txtpatientid" style="margin:10px;">
		<label> Contact No </label> 
		<input type="text" class ="input input-text" name="txtcontactno" valid="number" style="margin:10px;" maxlength="10"> <br/>
		<label> Date </label> 
		<input type="date" class ="input input-text" name="txtstartdate" valid="date" style="margin:10px;width:10%"> <label>to</label> 
		<input type="date" class ="input input-text" name="txttodate" valid="date" style="margin:10px;width:10%"> 
                <input type="checkbox" class="checkbox" value="showall" name="showall" text="Show All"> &nbsp <label> Show All </label>
		<input type="submit" class="btn btn-purple" value="Search" style="margin-left:3%;float:right">

		<div class="section-label"> 
			<label class="section-label">Available Patient List </label> 
		</div>

		<div class="table">
                    
                    <% 
                        //parse the request
                        String pid=request.getParameter("txtpatientid");

                        
                        boolean added = false;
                        
                        String searchcond=formSearchConditionForFindPatient(request);
                        String selectAll=request.getParameter("showall");
                        int showlimit=20;
                            
                    %>
			<table class="table">
				
				<tr class="table-head">
					<td class="table-head pt-id"> Patient Id</td>
					<td class="table-head pt-name" > Patient Name </td>
					<td class="table-head arr-date" > Arrival Date </td>
					<td class="table-head check-date" > Checkup </td>
					<td class="table-head con-no"> Contact No </td>
					<td class="table-head user" > User Name </td>
				</tr>
                                <%
                                                   
                                                try
                                                {
                                                    st=cn.createStatement();

                                                    String sql="SELECT patient_id,patient_name,arrival_date,contact_no,optician,checkup_date FROM checkup_info "+searchcond;

                                                    ResultSet rs=st.executeQuery(sql); 
                                                    
                                                    if(!rs.first())
                                                    {
                                                        out.print("<script type=\"text/javascript\"> alert(\"No REcords Found \"); </script>");
                                                    }else
                                                    {
                                                        int i=0;
                                                        do
                                                        {
                                                            out.print("<tr> "
                                                                + "<td id = \"record"+i+"\" > "+rs.getInt("patient_id")+" </td> "
                                                                + "<td> "+rs.getString("patient_name")+" </td>"
                                                                + "<td> "+rs.getDate("arrival_date")+" </td>"
                                                                + "<td> "+rs.getDate("checkup_date")+" </td>"
                                                                + "<td> "+rs.getBigDecimal("contact_no")+" </td>"
                                                                + "<td> "+rs.getString("optician")+" </td>"
                                                                + "<td class = \"action-view\" row = \""+i+"\" > <img class=\"img img-view\" src=\"css/img/view.png\" /> </td> "
                                                                + "<td class = \"action-delete\" row = \""+i+"\" > <img class=\"img img-delete\" src=\"css/img/delete.png\" /> </td>"
                                                                + "</tr>");
                                                            i++;
                                                        }while(rs.next() && (selectAll!=null?true:i<showlimit));
                                                    }
                                                    
                                                    st.close();
                                                    rs.close();
                                                }catch(Exception e)
                                                {
                                                    out.print("<script type=\"text/javascript\"> alert(\"Error occured while reading from database "+e+"\"); </script>");
                                                    e.printStackTrace();
                                                }
                                    %>
                            
				<!--<tr>
					<td> PA11</td>
					<td> Anil Patil </td>
					<td> 22-9-2017 </td>
					<td> 22-9-2017 </td>
					<td> 8977453212 </td>
					<td> Ajinkya jadhav</td>
				</tr>
				-->
                                
			</table>
		</div>
		
	</form>
        <%@include file="master/userpanel.jsp" %>
        <script type="text/javascript" src="js/validation-common.js"></script>
        <script type="text/javascript" src="js/find-patient.js"></script>
</body>
</html>
