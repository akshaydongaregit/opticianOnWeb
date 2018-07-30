<%-- 
    Document   : help
    Created on : Dec 12, 2017, 7:37:29 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Optosoft - Help</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/help.css">
        
    </head>
    <body>
        <% String helpImages[] = new String[]{
            "css/img/doc/optosoft-login.png",
            "css/img/doc/optosoft-signup.png",
            "css/img/doc/optosoft-home3.png",
            "css/img/doc/optosoft-dispense.png",
            "css/img/doc/optosoft-edit-patient.png",
            "css/img/doc/optosoft-view-patient.png"
        }; 
        String titles[]=new String[]{
            "Login",
            "Creating new User",
            "Home Page",
            "Dispense Page",
            "Registering new Patient",
            "View Patient",
        };
        String loginLink="login.jpg";
        String descs[]=new String[]{
        "Open Login page by entring <a href=\"\"> "+loginLink+"</a> in Browser <br> Enter username ,password and click on login",
            "If you dont have username then you can crate new user account by signup <br> Click on signup button from login page and fill the form and click signup",
            "After login home page will open which will look like below <br> from this page provides links to <a> add new patient </a> <a> view patient </a> "
                +"<a> patient checkup</a> <a> find patient </a>",
            "you can go to dispense page by clicking dispense from link provided in menu <br>"
                + "which will look like below <br> from this page provides links to <a> add new Invoice </a> <a> view Invoice </a> "
                +" <a> find Invoice </a>",
            "You can add new Patient by cicking on add new Patient from home page then following form will appear fill form and click add button",
            "You can view patien you have registerd but checkup is not conducted by clicking on view patient from homepage<br>"
                + "page will show patient list and at top it will give option to search based on multiple condition you can view patient satisfing specified condition "
                + "by filling form and click on search button",
        };
        %>
        
        <div class="back">
        <img  class="back-img" src="css/img/blogging_2.jpg"> <br>
        </div>
        
            <%for(int i=0;i<helpImages.length;i++){%>
            <div class="help-step"> 
                <div class="title">
                    <h3><%=titles[i]%></h3>
                </div>
                <div class="desc">
                    <h4><%=descs[i]%><h4><br>
                    <img class="desc desc-img" src="<%=helpImages[i]%>" />
                </div>
            </div>
        <%}%>
        
    </body>
</html>
