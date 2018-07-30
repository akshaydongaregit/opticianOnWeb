<%-- 
    Document   : Color.jsp
    Created on : Jan 20, 2018, 10:15:35 PM
    Author     : DONGRE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #box{
                height:200px;
                width: 200px;
            }
            
            </style>
    </head>
    <body>
        <h1>Color Illustrator</h1> <br>
        <input type="text" name="red" placeholder="red" id="r" value="0">
        <input type="text" name="green" placeholder="green" id="g" value="0">
        <input type="text" name="blue" placeholder="blue" id="b" value="0">
        <br><br>
        <div style="background:rgba(0,0,0,255)" id="box"></div>
    </body>
    
    <script language="javascript">
        var r=document.getElementById("r");
        var g=document.getElementById("g");
        var b=document.getElementById("b");
        var box=document.getElementById("box");
        
        function updateBox(){
            //console.log("changed");
            var style="background:rgba("+r.value+","+g.value+","+b.value+",255);";
            box.setAttribute("style",style);
            }
        r.onkeyup=function(){updateBox();}
        g.onkeyup=function(){updateBox();}
        b.onkeyup=function(){updateBox();}
    </script>
</html>
