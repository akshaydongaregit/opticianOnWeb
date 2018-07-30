<%-- 
    Document   : signup
    Created on : Oct 14, 2017, 3:53:46 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>	OptoSoft - Create new user  </title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/signup.css"> 
    
    </head>
    <body>
	<div class="header" >
		<h1 class="title"> Optosoft </h1>
		<h5 class="title-tip"> Asistance to Opticians </h5>
	</div>

	<form class="form" action="AddUser" method="post" valid="all-filled">
		<label> Full Name </label> 
		<input type="text" class ="input input-text" name="txtname" id="txtname" style="margin:10px;" valid="char" > <br/>
		<label> Date Of Birth </label> 
		<input type=date class = "input input-text" name="txtdob" style="margin:20px;"> <br/>
		<!--<label> Age </label> 
		<input type="text" class ="input input-text" name="txtage" style="margin:20px;"> <br/> -->
		<label> Gender </label> 
		<input type="radio" class="radio radio-purple" name="radio-gender" value="male" > <label id="lbl-male">Male</label>
                <input type="radio" class="radio radio-purple" name="radio-gender" value="female"> <label id="lbl-male">Female</label> <br/>
		<label> Address </label> 
		<input type="text" class ="input input-text" name="txtaddress" style="margin:20px;"> <br/>
		<label> Mobile no. </label> 
                <input type="text" class ="input input-text" name="txtmobileno" style="margin:20px;" maxlength="10" valid="number"> <br/>
		<label> E-Mail </label> 
		<input type="text" class ="input input-text" name="txtemail" style="margin:20px;" valid="email"> <br/>
                <label> User Name </label> 
		<input type="text" class ="input input-text" name="txtusername" id="txtname" style="margin:10px;"> <br/>
                <label> Password </label> 
		<input type="password" class ="input input-text" name="txtpassword" id="txtname" style="margin:10px;"> <br/>
                <label> Confirm Password </label> 
		<input type="password" class ="input input-text" name="txtconfpassword" id="txtname" style="margin:10px;"> <br/>
                
		<input type="submit" class="btn btn-purple" value="Sign Up"> <br/>
	</form>
        
        <script type="text/javascript" src="js/validation-common.js"></script>
    </body>
</html>
