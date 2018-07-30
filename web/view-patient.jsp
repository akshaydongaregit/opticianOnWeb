<%-- 
    Document   : view-patient
    Created on : Oct 14, 2017, 8:19:47 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>	OptoSoft - View Patient </title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/view-patient.css"> 
</head>
<body >
        <%@include file="master/user-selector.jsp" %>
        <%@include file="master/cdefinit.jsp" %>
        
	<!-- Header / Software Name-->
	<div class="header" >
		<h1 class="title"> Optosoft</h1>
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
		<input type="text" class ="input input-text" name="txtpatientname" valid="char" style="margin:10px;">
		<label> Optician Name </label> 
		<input type="text" class ="input input-text" name="txtopticianname" valid="char" style="margin:10px;"> <br/>
		<label> Patient Id </label> 
		<input type="text" class ="input input-text" name="txtpatientid" style="margin:10px;">
		<label> Contact No </label> 
                <input type="text" class ="input input-text" name="txtcontactno" valid="number" style="margin:10px;" maxlength="10"> <br/>
		<label> Date </label> 
		<input type="date" class ="input input-text" name="txtstartdate" valid="date" style="margin:10px;width:10%"> <label>to</label> 
		<input type="date" class ="input input-text" name="txttodate" valid="date" style="margin:10px;width:10%"> 
		<input type="submit" class="btn btn-purple" value="Search" style = "margin-left:3%;float:right" >
                <input type="checkbox" class="checkbox" value="showall" name="showall" text="Show All"> &nbsp <label> Show All </label>
                
		<div class="section-label"> 
			<label class="section-label">Available Patient List </label> 
		</div>

		<div class="table">
			<table class="table">
				
				<tr class="table-head">
					<td class="table-head pt-id"> Patient Id</td>
					<td class="table-head pt-name" > Patient Name </td>
					<td class="table-head arr-date" > Arrival Date </td>
					<td class="table-head con-no"> Contact No </td>
					<td class="table-head user" > User Name </td>
                                        <td  class="table-head view"> </td>
                                        <td  class="table-head delete"> </td>
				</tr>
				
                                
                                
                                <!--
                                            find records and add them in row using jsp 
                                -->
                                
                                <%@page import="java.sql.*" %>
                                <%
                                            
                                            boolean added = false;
                                    
                                            
                                            String searchcond = formSearchConditionForPatient(request);
                                            System.out.println("searchcond :"+searchcond);
                                            String selectAll=request.getParameter("showall");
                                            int showlimit=20;
                                            
                                                try
                                                {
                                                    st=cn.createStatement();

                                                    String sql="SELECT id,name,arrival,contact_no,user_name FROM patients"+searchcond;

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
                                                                + "<td id = \"record"+i+"\" > "+rs.getInt("id")+" </td> "
                                                                + "<td> "+rs.getString("name")+" </td>"
                                                                + "<td> "+rs.getDate("arrival")+" </td>"
                                                                + "<td> "+rs.getBigDecimal("contact_no")+" </td>"
                                                                + "<td> "+rs.getString("user_name")+" </td>"
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
                                            <td> PA12</td>
                                            <td> Anilket Patil </td>
                                            <td> 24-9-2017 </td>
                                            <td> 7776456212 </td>
                                            <td> Ajinkya jadhav</td>
                                            <td> <img class="img img-view" src="css/img/view.png" /> </td>
                                            <td> <img class="img img-delete" src="css/img/delete.png" /> </td>
                                    </tr>
                                    
                                   -->              
			
			</table>
                    
		</div>
		
	</form>
        
        <script type="text/javascript" src="js/validation-common.js"></script>
        <script type="text/javascript" src="js/table-handler.js"></script>
        <%@include file="master/userpanel.jsp" %>
</body>
</html>
