<%-- 
    Document   : new-invoice
    Created on : Oct 14, 2017, 8:36:10 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>	OptoSoft-New Invoice </title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/new-invoice.css"> 
        
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
    <body>
        <%@include file="master/user-selector.jsp" %>
        <%@include file="master/cdefinit.jsp" %>
                   
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
        <form class="form" action="new-invoice.jsp" method="get" valid="all-filled">
		
		<label> Name </label> 
		<input type="text" class ="input input-text" name="txtpatientname" valid="char" style="margin:10px;">
		<!--<label> Date </label> 
		<input type="text" class ="input input-text" name="txtdate" valid="date" style="margin:10px;"> --> <br>
		<label> Mobile No. </label> 
                <input type="text" class ="input input-text" name="txtmobileno" valid="number" style="margin:10px;" maxlength="10"> <br>
		
                <label> Frame </label> 
                <!--<input type="text" class ="input input-text" name="txtframetype" style="margin:10px;">-->
                <%
                   %><select name="txtframetype" ><%
                    for(int i=0;i<frameTypes.length;i++)
                    {
                        %><option value="<%= frameTypes[i]%>" > <%= frameTypes[i]%> </option>><%
                    }
                   %></select><%
                
                %>
                <input type="text" class ="input input-text" name="txtframeprice" id = "frameprice" style="margin-left:10%;" placeholder="    Frame Price"> <br> 
		
                <label> Lens </label> 
		<%
                   %><select name="txtlenstype" ><%
                    for(int i=0;i<lensTypes.length;i++)
                    {
                        %><option value="<%= lensTypes[i]%>" > <%= lensTypes[i]%> </option>><%
                    }
                   %></select><%
                
                %>
                <input type="text" class ="input input-text" name="txtlensprice" style="margin-left:10%;" placeholder="    Lens Price"> <br>
		
                <label> Solution </label> 
		<input type="text" class ="input input-text" name="txtsolutionprice" style="margin:10px;"> <br>
		<label> Total </label> 
		<input type="text" class ="input input-text" name="txtprice" style="margin:10px;"> <br>
		<label> Advance </label> 
                <input type="text" class ="input input-text" name="txtadvance" style="margin:10px;"> <br>
                <label> Remaining </label> 
		<input type="text" class ="input input-text" name="txtremaining" style="margin:10px;"> <br>
		
                <input type="submit" class="btn btn-purple" value="Save" onclick="handle_action('save');">
                <!-- <input type="submit" class="btn btn-purple" value="Generate Recipient" style="width:25%" onclick="handle_action('generate');"> -->
                <input type="hidden" name="action"  value="" >
                
        </form>
        
        
        <%@page import="java.util.*" %>
        
        <%
            //System.out.print("parsing the request...");
            String action = request.getParameter("action");
            String fullname,mobileno,frametype,frameprice,lenstype,lensprice,solutionprice,price,advance;
            String user=username;
                 
                fullname = request.getParameter("txtpatientname"); 
                 mobileno = request.getParameter("txtmobileno");
                 frametype = request.getParameter("txtframetype");
                 frameprice = request.getParameter("txtframeprice");
                 lenstype = request.getParameter("txtlenstype");
                 lensprice = request.getParameter("txtlensprice");
                 solutionprice = request.getParameter("txtsolutionprice");
                 price = request.getParameter("txtprice");
                 advance = request.getParameter("txtadvance");
                 
            //String username = request.getParameter("txtusername");
            //System.out.print("\n request is parsed ");
            
            if(action!=null && !action.equalsIgnoreCase("") && action.equalsIgnoreCase("save"))
            {
                
                boolean added = false;
                
                //insert values
                              
                try
                {
                    st=cn.createStatement();

                    String sql="INSERT INTO invoices (name,contact_no,frame_type,frame_price,lens_type,lens_price,solution_price,price,advance,created,username) "
                            + " VALUES ('"+fullname+"','"+mobileno+"','"+frametype+"','"+frameprice+"','"+lenstype+"','"+lensprice+"','"+solutionprice+"','"+price+"','"+advance+"','"+today+"','"+user+"')";

                    st.executeUpdate(sql);
                    added = true;
                }catch(Exception e)
                {
                     out.print("<script type=\"text/javascript\"> alert(\"Error occured while writing to database database "+e+"\"); </script>");
                    added=false;
                }
                if(added)
                {
                    out.print("<script type=\"text/javascript\"> alert(\"Invoice created successfully\") </script>");
                }
            }else if(action!=null && !action.equalsIgnoreCase("") && action.equalsIgnoreCase("generate"))
            {
                
            }
            
        %>
        <%@include file="master/userpanel.jsp" %>
        <script type="text/javascript" src="js/validation-common.js"></script>
        <script type="text/javascript"> 
            
            var solution = document.getElementsByName("txtsolutionprice").item(0);
            solution.oninput= function ()
            {
              var total = parseFloat(document.getElementsByName("txtframeprice").item(0).value) + parseFloat(document.getElementsByName("txtlensprice").item(0).value) + parseFloat(solution.value);
              document.getElementsByName("txtprice").item(0).setAttribute("value",""+total);
            }
            
            var advance = document.getElementsByName("txtadvance").item(0);
            advance.oninput = function ()
            {
              var remaining = parseFloat(document.getElementsByName("txtprice").item(0).value) - parseFloat(advance.value);
              document.getElementsByName("txtremaining").item(0).setAttribute("value",""+remaining);
            }
            
            
        </script>
</body>
</html>
