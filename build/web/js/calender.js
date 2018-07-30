var i=0;
var dates = document.getElementsByClassName("date");
console.log(dates.length);

function handle_click(event,date)
{
	console.log("clicked"+date);
}

for (i=0;i<dates.length ; i++ )
{
	dates.item(i).addEventListener("click",new handle_click(dates.item(i)),!1)
}
