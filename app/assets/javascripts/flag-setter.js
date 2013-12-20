function onHover()
{
    $("#flag").attr('src', 'assets/on.png');
}

function offHover()
{
    $("#flag").attr('src', 'assets/off.png');
}

function flagSet()
{
	if(document.getElementById('flag').getAttribute("onmouseout")=='')
		$("#flag").attr('onmouseout','offHover();');
	else
		$("#flag").attr('onmouseout','');
    $("#flag").attr('src', 'assets/on.png');
    $("#flag").attr('title', '<%=current_user.id%>');
}
