<%-- 
    Document   : invoice
    Created on : Dec 1, 2017, 8:41:11 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invoice</title>
    </head>
    <body>
        
        <%String action = request.getParameter("action");%>
       <link rel="stylesheet" href="css/style.css">
       <%if(action!=null && action.equalsIgnoreCase("view")){%>
       <link rel="stylesheet" href="css/invoice.css"> 
        <% } %>
        <%if(action!=null && action.equalsIgnoreCase("generate")){%>
       <link rel="stylesheet" href="css/invoicet.css"> 
        <% } %>
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
       <%@include file="master/cdefinit.jsp" %>
       
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

	
            <!--  Parse request and generate form   -->
           
            <%
               
                String id=request.getParameter("id");
                
                if(action!=null && action.equalsIgnoreCase("view") && id!=null)
                {
                    
                        
                        try
                        {
                            st=cn.createStatement();
 
                            String sql="SELECT name,contact_no,frame_type,frame_price,lens_type,lens_price,solution_price,price,advance,created,delivered,username FROM invoices where id = "+id ;

                            ResultSet rs=st.executeQuery(sql);
                            if(!rs.first())
                            {
                                out.print("<script type=\"text/javascript\"> alert(\"Oops it seem's like record is not available for id \"); </script>");
                            }else
                            {
                                
                                %> <form class="form" valid="all-filled"> <%
                                out.print(""
                                        +"<label> Id </label>" 
                                        +"<input type=\"text\" class =\"input input-text\" value = \""+id+"\" name=\"txtid\" id=\"txtid\" style=\"margin:10px;\" >"
                                        +"<label> Created </label>" 
                                        +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getString("created")+"\" name=\"txtcreated\" style=\"margin:20px;\" valid=\"number\" >"
                                        +"<label> Delivered </label>" 
                                        +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getString("delivered")+"\" name=\"txtdelivered\" style=\"margin:20px;\" valid=\"number\" > <br/>"
                                        +"<label> Patient Name </label>" 
                                        +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getString("name")+"\" name=\"txtname\" id=\"txtpname\" valid=\"char\" style=\"margin:10px;\">"
                                        +"<label> Mobile no. </label>" 
                                        +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getBigDecimal("contact_no")+"\" name=\"txtmobileno\" style=\"margin:20px;\"> <br>" 
                                        +"<label> frame type </label>"); 
                                        %><select  name="txtftype"  >
                                            <option value="<%= rs.getString("frame_type")%>" > <%= rs.getString("frame_type")%> </option>
                                        <%
                                            for(int i=0;i<frameTypes.length;i++)
                                            {
                                                %><option value="<%= frameTypes[i]%>" > <%= frameTypes[i]%> </option>><%
                                            }
                                        %>
                                        </select>
                                        <%
                                        out.print("<label> frame price </label>" 
                                        +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getFloat("frame_price")+"\" name=\"txtfprice\" style=\"margin:20px;\" valid=\"number\" > <br/>"
                                        +"<label> lens type </label>");
                                        %><select name="txtltype" >
                                            <option value="<%= rs.getString("lens_type")%>" > <%= rs.getString("lens_type")%> </option>
                                        <%
                                            for(int i=0;i<lensTypes.length;i++)
                                            {
                                                %><option value="<%= lensTypes[i]%>" > <%= lensTypes[i]%> </option>><%
                                            }
                                        %>
                                        </select>
                                        <%
                                        out.print("<label> lens price </label>" 
                                        +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getFloat("lens_price")+"\" name=\"txtlprice\" style=\"margin:20px;\" valid=\"number\" >"
                                        +"<label> solution price </label>" 
                                        +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getFloat("solution_price")+"\" name=\"txtsprice\" style=\"margin:20px;\" valid=\"number\" > <br/>"
                                        +"<label> Total </label>" 
                                        +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getFloat("price")+"\" name=\"txttotal\" style=\"margin:20px;\" valid=\"number\" >"
                                        +"<label> Advance </label>" 
                                        +"<input type=\"text\" class =\"input input-text\" value = \""+rs.getFloat("advance")+"\" name=\"txtadvance\" style=\"margin:20px;\" valid=\"number\" >"
                                        +"<label> Remaining </label>" 
                                        +"<input type=\"text\" class =\"input input-text\" value = \""+(rs.getFloat("price")-rs.getFloat("advance"))+"\" name=\"txtremaning\" style=\"margin:20px;\" valid=\"number\" > <br/>"
                                         );
                                         %>
                                                 
                                <input type="hidden" name="action" value="" />
                                <input type="submit" class="btn btn-purple" value="Save" onclick="handle_action('save');">
                                <input type="submit" class="btn btn-purple" value="Generate Invoice" onclick="handle_action('generate');">
                                </form>
                        <%
                            }
                        }catch(Exception e)
                        {
                            out.print("<script type=\"text/javascript\"> alert(\"Error occured while reading from database "+e+"\"); </script>");    
                        }
                                                    
                }
                
                if(action!=null && action.equalsIgnoreCase("save"))
                {
                    //parse request
                        String name,mobileno,ftype,fprice,ltype,lprice,sprice,created,total,advance,remaning;
                        name = request.getParameter("txtname");
                        id = request.getParameter("txtid");
                        mobileno = request.getParameter("txtmobileno");
                        ftype = request.getParameter("txtftype");
                        fprice = request.getParameter("txtfprice");
                        ltype = request.getParameter("txtltype");
                        lprice = request.getParameter("txtlprice");
                        sprice = request.getParameter("txtsprice");
                        total = request.getParameter("txttotal");
                        advance = request.getParameter("txtadvance");
                        remaning = request.getParameter("txtremaning");
                        created = request.getParameter("txtcreated");
                        
                        if(name!=null && id!=null && mobileno!=null && ftype!=null && fprice!=null && ltype!=null && lprice!=null && sprice!=null && total!=null && advance!=null && remaning!=null && created!=null)
                        {
                            
                            boolean added = false;
                            
                            //insert values
                           
                            try
                            {
                                st=cn.createStatement();
                                String sql="update invoices set name = '"+name+"',contact_no = '"+mobileno+"', frame_type = '"+ftype+"', frame_price = '"+fprice+"', lens_type = '"+ltype+"',lens_price = '"+lprice+"',solution_price = '"+sprice+"',price = '"+total+"',created = '"+created+"' where id = "+id;
                                st.executeUpdate(sql);
                                out.print("<script type=\"text/javascript\"> alert(\"Record saved successfully \"); </script>");
                            }catch(Exception e)
                            {
                                 out.print("<script type=\"text/javascript\"> alert(\"Error occured while writing to database database "+e+"\"); </script>");

                            }
                            out.print("<script type=\"text/javascript\"> window.location=\"invoice.jsp?action=view&id="+id+"\" </script>");
                        }else
                        {
                            out.print("<script type=\"text/javascript\"> alert(\"please fill all fields \"); </script>");
                        }
                }
                
                if(action.equalsIgnoreCase("store"))
                {
                    String name,gst;
                    name = request.getParameter("txtname");
                    id = request.getParameter("txtid");
                    gst = request.getParameter("txtgst");
                    try
                    {
                        st=cn.createStatement();
                        String sql="update invoices set delivered = '"+today+"',  deliverded = "+1+" where id = "+id;
                        st.executeUpdate(sql);
                        out.print("<script type=\"text/javascript\"> alert(\"invoice saved successfully \"); </script>");
                    }catch(Exception e)
                    {
                        out.print("<script type=\"text/javascript\"> alert(\"Error occured while saving record "+e+"\"); </script>");
                        e.printStackTrace();
                    }

                }
            if(action.equalsIgnoreCase("generate"))
            {
                %>
                
                <form  name="invoice-form" action="invoice.jsp">
                <div class="template">
                    <div class="header">
                            <label class="title">Ranjan</label> <br>
                            <label class="title tip">opticians</label>
                    </div>
                    <div class="form">
                                <label> <b> Invoice no : </b> <%= request.getParameter("txtid") %> </label>
                                <input type="hidden" name="txtid" value="<%= request.getParameter("txtid")%>">
				<label style="float:right;"> <b> Date : </b> <%= today %> </label> <br>
				
                                <label> <b> Name </b> </label> 
                                <input type="text" class ="input input-text" value = "<%= request.getParameter("txtname") %>" name="txtname" style="margin:10px;"> <br>
				
                                <div class="table">
					<table class="table">
						<tr class="table-row">
							<td class="table-head" name="prod" > <b> Product </b> </td>
							<td  class="table-head" name="details" > <b> Details </b> </td>
							<td class="table-head" name="price" > <b> Price </b> </td>
						</tr>
						
						<tr class="table-row">
							<td>Frame</td>
							<td > <%= request.getParameter("txtftype") %>  </td>
                                                        <td > <%= request.getParameter("txtfprice") %> </td>
						</tr>
					
						<tr class="table-row">
							<td>Lens</td>
							<td > <%= request.getParameter("txtltype") %> </td>
                                                        <td > <%= request.getParameter("txtlprice") %> </td>
						</tr>
                                                <tr class="table-row">
							<td>Solution</td>
							<td></td>
                                                        <td > <%= request.getParameter("txtsprice") %> </td>
						</tr>
                                                <tr class="table-row" colspan = 1>
                                                    <td colspan="2" > <b> Total </b> </td>
                                                    <td ><%= request.getParameter("txttotal") %></td>
                                                </tr>
					</table>
				</div>
                                 <label> <b> GST </b> </label> 
                                 
                                 <% 
                                     float gstr = 0.05f;
                                     float gst = Float.parseFloat(request.getParameter("txttotal"))*gstr; 
                                 %> 
                                 
                                <input type="text" class ="input input-text" value = "<%=  gst %>" name="txtgst" style="margin:10px;"> <br>
                                     
                    </div>      
			<div class="footer">
				<label class="logo" > Ranjan </label> <label class="footer info address">Rani Luxmibai Road Gadhinglaj <label>
				<br> <label class="logo tip" > Opticians </label> <label class="footer info contact"> Contact No - 222607  <label> <br>
				<label class="logo tip info" > Compact Lens Clinic </label>
			</div>
                </div>
                        <input type="hidden" name="action" value="store"/>
			<input type="submit" class="btn btn-purple pre-btn" value="Save" style="width:25%;margin-left:20%" >
			<input type="submit" class="btn btn-purple pre-btn" value="Print" style="width:25%" >
                 </form>
            <%}%>
          
            <%@include file="master/userpanel.jsp" %>
            <script type="text/javascript" src="js/validation-common.js"></script>
    </body>
</html>
