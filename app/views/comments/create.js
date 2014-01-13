<% if @comment.valid? %>
  $("#modal-close").click();
  $("#panel_comment_<%= @comment.answer.id%>").remove();
  $("#comments_<%= @comment.answer.id%>").append("<%= escape_javascript( render 'comments/comment', :comment => @comment ) %>");
  $("#comments_<%= @comment.answer.id%>").before("<%= escape_javascript(show_notice(notice)) %>");
  $(".alert").fadeOut(5000);
<% else %>
  $(".modal-body").before("<%= escape_javascript(show_alert(@comment.errors.full_messages.join(", "))) %>");
  $(".alert").fadeOut(5000);
<% end %>