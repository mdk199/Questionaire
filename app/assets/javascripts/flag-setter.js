function onHover(a)
{
    $("#flag_"+a).attr('src', 'assets/on.png');
}

function offHover(a)
{
    $("#flag_"+a).attr('src', 'assets/off.png');
}

function flagSet(a,b)
{
	if(document.getElementById('flag_'+a).getAttribute("onmouseout")=='')
	{
		$("#flag_"+a).attr('onmouseout','offHover('+a+');');
		$("#flag_"+a).attr('title', 'Flag');
	}
	else
	{
		$("#flag_"+a).attr('onmouseout','');
    	$("#flag_"+a).attr('src', 'assets/on.png');
    	$("#flag_"+a).attr('title', b);
    }
}
