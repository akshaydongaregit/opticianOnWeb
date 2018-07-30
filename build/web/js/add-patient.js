var txtname=document.getElementById("txtname");
txtname.onkeydown=function(event)
{
    var key=event.keyCode;
    if(( key<65 || key>90 ) && key!=8)
    {
        console.log("Invalid "+key);
        txtname.readOnly=true;
    }else
    {
        txtname.readOnly=false;        
    }
    //console.log("typed : "+event.keyCode)
    //alert("typed : "+event.keyCode)
}

var txtage=document.getElementsByName("txtage");
txtage.item(0).onkeydown=function(event)
{
    var key=event.keyCode;
    if((key>=48 && key<=58) || (key>=96 && key<=105) || key==8 ) {
            txtage.item(0).readOnly=false;
    }else{
        txtage.item(0).readOnly=true;
    }
    //console.log("typed : "+key);
}

var txtmobileno=document.getElementsByName("txtmobileno").item(0)
 txtmobileno.onkeydown=function(event)
{
    var key=event.keyCode;
    if((((key>=48 && key<=58) || (key>=96 && key<=105))   && txtmobileno.value.length<=10 ) || key==8) {
             txtmobileno.readOnly=false
    }else{
         txtmobileno.readOnly=true;
    }
    //console.log("typed : "+key);
}