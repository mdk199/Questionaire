$("#questionpanel_<%= @question.id%>").before("<%= escape_javascript(show_notice(notice)) %>");
$("#questionpanel_<%= @question.id%>").remove();
setTimeout(function(){$(".alert").remove();},2000);