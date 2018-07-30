<%-- 
    Document   : home
    Created on : Oct 14, 2017, 8:09:33 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Optosoft - Home</title>
   <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/home.css"> 
</head>
<body>
    <%@include file="master/user-selector.jsp" %>
	<div class="header">
		<h1 class="title"> Optosoft </h1>
		<label class="title-tip"> Assistance to Opticians </label>
                <!--<img src="css/img/switch-off.png">-->
	</div>
        
	<div class="menu">
	<nav class="navbar">
		<ul>
			<li> <a href = "user.jsp" > User </a> </li>
			<li> <a href = "dispense.jsp" > Dispense </a> </li>
                        <li> <a href = "Reports/patient.jsp" > Reports </a> </li>
			<li> <a href = "help.jsp" > Help </a> </li>
			<li> <a href = "LogOut"> Log Out </a> </li>
		</ul>
	</nav>
	</div>
	
	<div class="body">
		
            <a href="add-patient.jsp" class="link">
		<div class="panel new-patient">
			<img class = "panel-image" src="css/img/addusericon.png">
			<div class= "panel-footer" > <h3>  Add New Patient </h3> </div>
		</div>
		</a>
		
		<a href="view-patient.jsp" class="link">
		<div class="panel view-patient">
			<div class="panel-body"> <img class = "panel-image" src="css/img/finduser1.png"> 
			</div>
			<div class= "panel-footer" > <h3>  View Patient </h3> </div>
		</div>
		</a>
		
            <a href="checkup.jsp" class="link">
		<div class="panel checkup">
			<div class="panel-body">
				<img class = "panel-image" src="css/img/checkup.png">
			</div>
			<div class= "panel-footer" >
				<h3>  Patient Checkup </h3> </div>
		</div>
		</a>
		
		<a href="find-patient.jsp" class="link">
		<div class="panel find-patient">
			<div class="panel-body">
				<img class = "panel-image" src="css/img/finduser1.png">
			</div>
			<div class= "panel-footer" > <h3> Find Patient </h3> </div> </div>
		</div>
		</a>
            
                <!--<div class="panel new-patient">
			<h2> <a href="add-patient.jsp?txtname="> Add New Patient </a> </h2>
		</div>
		<div class="panel view-patient">
			<h2> <a href="view-patient.jsp"> View Patient </a> </h2>
		</div>
		<div class="panel checkup">
			<h2> <a href="checkup.jsp"> Patient Checkup </a> </h2>
		</div>
		<div class="panel find-patient">
			<h2> <a href="find-patient.jsp"> Find Patient </a> </h2>
		</div>-->
	</div>

	<div class="footer">
        </div>
        <%@include file="master/userpanel.jsp" %>
        <script type="text/javascript" src="js/form-common.js"></script>
    </body>
</html>
