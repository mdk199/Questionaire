<% if @answer.valid? %>
  CKEDITOR.instances.editor_<%= @answer.question.id%>.setData('');
  $("#panel_answer_<%= @answer.question.id%>").remove();
  $('#add_answer_<%= @answer.question.id%>').attr('disabled', false);
  $("#new_answer_<%= @answer.question.id%>").remove();
  // CKEDITOR.instances.editor_<%= @answer.question.id%>.destroy();
  $("#answers_<%= @answer.question.id%>").append("<%= escape_javascript( render 'answers/answer', :answer => @answer ) %>");
  $("#questionpanel_<%= @answer.question.id%> form")[0].reset();
  $("#questionpanel_<%= @answer.question.id%> form").before("<%= escape_javascript(show_notice(notice)) %>");
  $(".alert").fadeOut(5000);
<% else %>
  $("#questionpanel_<%= @answer.question.id%> form").before("<%= escape_javascript(show_alert(@answer.errors.full_messages.join(", "))) %>");
  $(".alert").fadeOut(5000);
<% end %>