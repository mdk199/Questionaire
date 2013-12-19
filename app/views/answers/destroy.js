$("#answer_<%= @answer.id%>").before("<%= escape_javascript(show_notice(notice)) %>");
$("#answer_<%=@answer.id%>").remove();
setTimeout(function(){$(".alert").remove();},2000);