if(window.location.pathname =="/questions/blocked")
alert("Question is removed permanently");
else
{	
	$("#questionpanel_<%= @question.id%>").before("<%= escape_javascript(show_notice(notice)) %>");
	$("#questionpanel_<%= @question.id%>").remove();
	setTimeout(function(){$(".alert").remove();},2000);
}