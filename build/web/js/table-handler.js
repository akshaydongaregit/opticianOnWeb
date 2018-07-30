/*  _______________________________
  /     T-Resk Organization       /
 /______________________________*/
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function handle_delete(td)
{
 var rowtd= document.getElementById("record"+td.getAttribute("row"));
 //alert("handling delete action of row "+rowtd+" id = "+rowtd.innerHTML);
 window.location="PatientHandler?action=delete&id="+rowtd.innerHTML+"&from=view-patient.jsp";
}
function handle_view(td)
{
 var rowtd= document.getElementById("record"+td.getAttribute("row"));
 //alert("handling view action of row "+rowtd+" id = "+rowtd.innerHTML);
 window.location="patient.jsp?action=view&id="+rowtd.innerHTML;
}

//registering delete action event
var actions= document.getElementsByClassName("action-delete");
for(var i=0; i< actions.length ; i++)
{
var action = actions.item(i);
action.setAttribute("onclick","handle_delete(this)");
}

//registering view action event
var actions= document.getElementsByClassName("action-view");
for(var i=0; i< actions.length ; i++)
{
var action = actions.item(i);
action.setAttribute("onclick","handle_view(this)");
}
