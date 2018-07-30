
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            boolean randomColor = true;
            String colors[]=new String[]
            {
                "#11f",
                "#1f911f",
                "#1f1",
                "#fa1",
                "a1f",
                "#947",
                "#942",
                "#e41"
            };
            
            

        %>
        <style>
            .img.img-round
            {
                    border-radius:50%; 
                    border: 2px <% int r=-1; while((r>=colors.length || r<0)){r = (int)(colors.length*(new java.util.Random().nextFloat()));}  out.print(colors[r]); %> outset;
            }
            #div-logout{
                display:none;
            }
            .img.user-img:hover #div-logout
            {
                display:block;
            }
        </style>
    </head>
    <body>
        
        <div id="div-logout"><a href="LogOut">LOGOUT</a></div>
        	<div class="user_panel" >
                    <img class="img img-round user-img" src="css/img/userp1.png"> <br>
                    <label id="user-name"> <%= username %> </label>
       </div>
    </body>
</html>
