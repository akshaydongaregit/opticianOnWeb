<%-- 
    Document   : view-invoice
    Created on : Oct 14, 2017, 8:40:10 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>	OptoSoft-View Invoices </title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/view-invoice.css"> 
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
			<label class="section-label" name="invoice-info"> Invoice Information </label>
		</div>
		<label> Invoice No </label> 
		<input type="text" class ="input input-text" name="txtinvoiceno" valid="number" style="margin:10px;">
		<label> Patient Id </label> 
		<input type="text" class ="input input-text" name="txtpatientid" style="margin:10px;"> <br>
		<label> Patient Name </label> 
		<input type="text" class ="input input-text" name="txtpatientname" valid="char" style="margin:10px;">
		<label> Created By </label> 
		<input type="text" class ="input input-text" name="txtcreatedby" valid="char" style="margin:10px;"> <br/>
		<label> Contact No </label> 
                <input type="text" class ="input input-text" name="txtcontactno" valid="number" style="margin:10px;" maxlength="10">
		<label> Date of Creation </label> 
		<input type="date" class ="input input-text" name="txtstartdate" valid="date" style="margin:10px;width:10%"> <label>to</label> 
		<input type="date" class ="input input-text" name="txttodate" valid="date" style="margin:10px;width:10%"> 
		<input type="checkbox" class="checkbox" value="showall" name="showall" text="Show All"> &nbsp <label> Show All </label>
                
                <input type="submit" class="btn btn-purple" value="Search" style="margin-left:3%;float:right">
                
		<div class="section-label"> 
			<label class="section-label">Available Invoice List </label> 
		</div>

		<div class="table">
			<table class="table">
				
				<tr class="table-head">
					<td class="table-head inv-no"> Invoice No</td>
					<td class="table-head pt-name" > Patient Name </td>
					<td class="table-head creat-date" > Creation Date </td>
					<td class="table-head con-no"> Contact No </td>
					<td class="table-head price"> Price (Rs)</td>
					<td class="table-head user" > Created By</td>
				</tr>
				
                                <!--  Select invoices from database and display on page  -->
                                
                                <%@page import="java.sql.*" %>
                                <%
                                  
                                    boolean added = false;
                                    
                                    /*Parse the request*/
                                    String action = request.getParameter("action");
                                    String patientName = request.getParameter("txtpatientname");
                                    String selectAll=request.getParameter("showall");
                                    
                                    //check if record have to be removed
                                    if(action!=null && action.equalsIgnoreCase("remove"))
                                    {
                                        String rino = request.getParameter("rino");
                                        if(rino!=null)
                                        {
                                            try
                                            {
                                               st = cn.createStatement();
                                               String sql = "delete from invoices where id = "+rino+"";
                                               int res = st.executeUpdate(sql);
                                               if(res>0)
                                               {
                                                   out.print("<script type=\"text/javascript\"> alert("+"\" record(s) deleted\"); </script>");
                                                   
                                               }
                                            }catch(Exception e)
                                            {
                                                
                                            }
                                        }
                                    }
                                    
                                    String searchcond=formSearchConditionForViewInvoice(request);
                                    int showlimit=20;
                                        
                                        try
                                        {
                                            st=cn.createStatement();

                                            String sql="SELECT id,name,created,contact_no,price,username FROM invoices"+searchcond;

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
                                                        + "<td id = \"record"+i+"\" >"+rs.getInt("id")+" </td> "
                                                        + "<td> "+rs.getString("name")+" </td>"
                                                        + "<td> "+rs.getDate("created")+" </td>"
                                                        + "<td> "+rs.getBigDecimal("contact_no")+" </td>"
                                                        + "<td> "+rs.getFloat("price")+" </td>"
                                                        + "<td> "+rs.getString("username")+" </td>"
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

                                
			
			</table>
		</div>
		
	</form>
        
        <script type="text/javascript" src="js/validation-common.js"></script>
        <script type="text/javascript" src="js/view-invoice.js" ></script>
        <%@include file="master/userpanel.jsp" %>
</body>
</html>
 