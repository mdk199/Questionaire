<% if @answer.valid? %>
  $("#answers_<%= @answer.question.id%>").append("<%= escape_javascript( render 'answers/answer', :answer => @answer ) %>");
  $("#question_<%= @answer.question.id%> form")[0].reset();
  $("#question_<%= @answer.question.id%> form").before("<%= escape_javascript(show_notice(notice)) %>");
  $(".alert").fadeOut(5000);
<% else %>
  $("#question_<%= @answer.question.id%> form").before("<%= escape_javascript(show_alert(@answer.errors.full_messages.join(", "))) %>");
  $(".alert").fadeOut(5000);
<% end %>