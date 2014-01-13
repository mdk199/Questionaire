$("#comment_<%= @answer.id%>").attr("href","#");
$("#comment_<%= @answer.id%>").attr("data-toggle","modal");
$("#comment_<%= @answer.id%>").attr("data-target","#modal-window");
$('#modal-content_<%= @answer.id%>').html("<%=escape_javascript(render 'comments/form', :answer => @answer)%>" );
$('#comment_<%= @answer.id%>').click();