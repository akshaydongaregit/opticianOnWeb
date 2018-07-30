

<%-- 
    Document   : dispense
    Created on : Oct 14, 2017, 8:32:22 PM
    Author     : DONGRE
--%>
<%-- 1900+$F{created}.getYear()+"-"+$F{created}.getMonth()+"-"+$F{created}.getDate()--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> OptoSoft - dispense</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/dispence.css">
	<style type="text/css">
		
	</style> 
    </head>
    <body>
        <%@include file="master/user-selector.jsp" %>
        
	<div class="header" >
		<h1 class="title"> Optosoft </h1>
		<h5 class="title-tip"> Assistance to Opticians </h5>
	</div>

	<div class="menu">
	<nav class="navbar">
		<ul>
			<li> <a href = "user.jsp" > User </a> </li>
			<li> <a href = "home.jsp" > Home </a> </li>
                        <li> <a href = "Reports/dispense.jsp" > Reports </a> </li>
			<li> <a href = "help.jsp" > Help </a> </li>
			<li> <a href = "LogOut" > Log Out </a> </li>
		</ul>
	</nav>
	</div>
        
        <div class="body">
            
            <a href ="new-invoice.jsp" class="link">
                <div class="panel new-invoice" >
                            <img class = "panel-image new-invoice" src="css/img/add-invoice1.png">
                            <div class= "panel-footer" > <h3>  Add Invoice </h3> </div>
                    </div>
            </a>
            
            <a href ="view-invoice.jsp" class="link">
                <div class="panel new-invoice">
                            <img class = "panel-image view-invoice" src="css/img/invoice.png">
                            <div class= "panel-footer" > <h3>  View Invoices </h3> </div>
                    </div>
            </a>
            
            <a href ="find-invoice.jsp" class="link">
                <div class="panel new-invoice">
                            <img class = "panel-image find-invoice" src="css/img/find-invoice2.png">
                            <div class= "panel-footer" > <h3>  Find Invoice </h3> </div>
                    </div>
            </a>
            
        </div>
        
        <!--
		<div class="panel link new-invoice">
			<h2> <a href="new-invoice.jsp" > Add New Invoice </a> </h2>
		</div>
		<div class="panel view-invoice">
			<h2> <a href="view-invoice.jsp" > View Invoice </a> </h2>
		</div>
		<div class="panel find-invoice">
			<h2> <a href="find-invoice.jsp" > Find Invoices </a> </h2>
		</div>
	</div>
        -->
        
	<div class="footer">
	</div>
    </body>
    <%@include file="master/userpanel.jsp" %>
    <script type="text/javascript" src="js/form-common.js"></script>
</html>