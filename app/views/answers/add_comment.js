$ ('#comments_<%= @answer.id%>').append("<%=escape_javascript(render 'comments/form', :answer => @answer)%>" )
$('#add_comment_<%= @answer.id%>').attr('disabled', true);