$("#comment_<%= @comment.id%>").before("<%= escape_javascript(show_notice(notice)) %>");
$("#comment_<%=@comment.id%>").remove();
setTimeout(function(){$(".alert").remove();},2000);