<% if @comment.valid? %>
  $("#panel_comment_<%= @comment.answer.id%>").remove();
  $('#add_comment_<%= @comment.answer.id%>').attr('disabled', false);
  $("#comments_<%= @comment.answer.id%>").append("<%= escape_javascript( render 'comments/comment', :comment => @comment ) %>");
  $("#answerpanel_<%= @comment.answer.id%> form")[0].reset();
  $("#answerpanel_<%= @comment.answer.id%> form").before("<%= escape_javascript(show_notice(notice)) %>");
  $("#new_comment_<%= @comment.answer.id%>").remove();
  $(".alert").fadeOut(5000);
<% else %>
  $("#answerpanel_<%= @comment.answer.id%> form").before("<%= escape_javascript(show_alert(@comment.errors.full_messages.join(", "))) %>");
  $(".alert").fadeOut(5000);
<% end %>