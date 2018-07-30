/*-------------------------------------
 * T-Resk Organization
 * -----------------------------------*/

var fields = document.getElementsByTagName("input");
//alert("validations are active");
for(var i=0;i<fields.length;i++)
{
    var inf=fields.item(i);
    //console.log(inf);
    var valid=inf.getAttribute("valid");
    if(valid !=null && valid.toString().indexOf("char")>=0)
    {
        console.log("char validation added to "+inf);
        inf.setAttribute("onkeydown","validate_char(this,event)");
    }else if(valid!=null && valid.toString().indexOf("number")>=0)
    {
        console.log("number validation added to "+inf);
        inf.setAttribute("onkeydown","validate_number(this,event)");
    }else if(valid!=null && valid.toString().indexOf("date")>=0)
    {
        console.log("date validation added to "+inf);
        inf.setAttribute("onkeydown","validate_date(this,event)");
    }else if(valid!=null && valid.toString().indexOf("email")>=0)
    {
        console.log("email validation added to "+inf);
        inf.setAttribute("onkeydown","validate_email(this,event)");
    }
    /*else if(valid!=null && valid.toString().indexOf("all-filled")>=0)
    {
        console.log("all-filled validation added to "+inf);
        inf.addEventListener("click",function(){validate_all_filled();},false);
    }*/
}
//register onsubmit event to form
var forms = document.getElementsByTagName("form");
for(var i=0;i<forms.length;i++)
{
    var form = forms.item(i);
    var valid=form.getAttribute("valid");
   console.log("adding all-filled validaton"+valid+i);
    if(valid!=null && valid.toString().indexOf("all-filled")>=0)
    {
        console.log("all-filled validation added to "+inf);
        form.setAttribute("onSubmit","return(validate_all_filled(this,event));");
    }
}
    
function validate_all_filled(element,event)
{
    //alert("validating all filled");
    var fields = document.getElementsByTagName("input");
    var filled = true;
    for(var i=0;i<fields.length;i++)
    {
        var inf=fields.item(i);
        
        if(inf.value=="")
        {
            filled = false;
            alert("please fill all fields");
            inf.focus();
            return false;
        }
        var valid = inf.getAttribute("valid");
        if(valid!=null && valid.toString().indexOf("email")>=0)
        {
            filled = validate_email(inf.value.toString());
            if(!filled)
            {
                alert("please enter valid email address");
                
                return false;
            }
        }
    }
    //alert("result "+filled);
    if(!filled)
    {
        alert("please fill all fields");
        return false;
    }
    else
        return true;
}

function validate_char(element,event)
{
    var key=event.keyCode;
    if(( key<65 || key>90 ) && key!=8 && key!=32 && !( key>=37 && key<=40 ))
    {
    console.log("Invalid "+key);
    element.readOnly=true;
    }else
    {
        element.readOnly=false;        
    }
}

function validate_number(element,event)
{
    var key=event.keyCode;
	
    if((key>=48 && key<=58) || (key>=96 && key<=105) || key==8 || ( key>=37 && key<=40 )) {
            element.readOnly=false;
    }else{
        element.readOnly=true;
    }
    //console.log("typed : "+key);
}

function validate_date(element,event)
{
    var key=event.keyCode;
    var shift = event.shiftKey;
	var vlen=element.value.length;
	
    if(( !shift && ((key>=48 && key<=58) || (key>=96 && key<=105))) || key==8 || (!shift && key==173) || ( key>=37 && key<=40 )) {
            element.readOnly=false;
    }else{
        element.readOnly=true;
    }
	
	if(!shift && key==173)
	{
			
		   if(vlen<4)
			{
				   element.readOnly=true;
			}
		
			if(vlen==6)
			{
				var cval=element.value;
				var aval=cval.substring(0,5)+"0"+cval.charAt(vlen-1);
				//console.log("aval "+aval);
				element.value=aval;
			}
	}
	if(vlen>=4 && element.value.indexOf("-")<0 && key!=8 && key!=37 && key!=39 && key!=173)
	{
		element.readOnly=true;		
	}
	
	if(vlen==5 && key!=8)
	{
		if(!shift && (key!=49 && key!=97 && key!=48 && key!=96))
		{
				var cval=element.value;
				var aval=cval.substring(0,5)+"0";
				//console.log("aval "+aval);
				element.value=aval;
		}
	}
    //console.log("typed : "+key);
}

function validate_email(element,event)
{
    var key=event.keyCode;
	var shift = event.shiftKey;
	
    //console.log("typed : "+key);
    
    if((!shift && (( key>=65 && key<=90 ) ||  (key>=48 && key<=58))) || (key>=96 && key<=105) || (shift && key == 50) || key==8 || (!shift && key==190) || ( key>=37 && key<=40 ))
    {
        element.readOnly=false;
    }else
    {
        element.readOnly=true;
	}
	//console.log("shift key : "+event.shiftKey);
}

function validate_email(email)
{
    atpos = email.indexOf("@");
    dotpos = email.lastIndexOf(".");
    if (atpos < 1 || ( dotpos - atpos < 2 ))
    {
        return false;
    }
    
    return( true );
}