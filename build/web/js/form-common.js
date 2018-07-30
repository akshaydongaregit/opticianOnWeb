var fields = document.getElementsByTagName("input");
for(var i=0;i<fields.length;i++)
{
    var inf=fields.item(i);
    var type=inf.getAttribute("type");
    if(type=="text")
    {
       //inf.addEventListener("focus",function(event,inf){alert(inf); document.execCommand("selectall",null,false);},false);
    }
    if(type=="submit")
    {
        inf.addEventListener("click",function(){console.log("playing"); new Audio("media/LASER.WAV").play();},false);
        
    }
    
}

fields=document.getElementsByClassName("link");
for(var i=0;i<fields.length;i++)
{
    var inf=fields.item(i);
    inf.addEventListener("click",function(){console.log("playing"); new Audio("media/LASER.WAV").play();},false);
}
