$("#answer_<%=@answer.id%>").remove();
$("#question_<%= @answer.question.id%> form").before("<%= escape_javascript(show_notice(notice)) %>");
setTimeout(function(){$(".alert").remove();},2000);