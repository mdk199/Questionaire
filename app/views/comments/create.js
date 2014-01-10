<% if @comment.valid? %>
  $("#panel_comment_<%= @comment.answer.id%>").remove();
  $("#comments_<%= @comment.answer.id%>").append("<%= escape_javascript( render 'comments/comment', :comment => @comment ) %>");
  $("#questionpanel_<%= @comment.answer.question.id%> form").before("<%= escape_javascript(show_notice(notice)) %>");
  $("#new_comment_<%= @comment.answer.id%>").remove();
  $(".alert").fadeOut(5000);
<% else %>
  $("#questionpanel_<%= @comment.answer.question.id%> form").before("<%= escape_javascript(show_alert(@comment.errors.full_messages.join(", "))) %>");
  $(".alert").fadeOut(5000);
<% end %>