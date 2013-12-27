$("#approve_<%= @answer.id %>").replaceWith('<%= escape_javascript(link_to("", unapprove_answer_path(@answer), :title => "Unapprove", :remote => true, :class => "icon-ok" , :style => "color:green;", :id=>"approve_#{@answer.id}")) %>');
<% if @unapproved_answer.present? %>
  $("#approve_<%= @unapproved_answer.id %>").replaceWith('<%= escape_javascript(link_to("", approve_answer_path(@unapproved_answer), :title => "Approve", :remote => true, :class => "icon-ok" , :style => "color:red;", :id=>"approve_#{@unapproved_answer.id}")) %>');
  $("#answer_<%= @unapproved_answer.id %>").removeClass("panel-success").addClass("panel-default");
<% end %>
$("#answer_<%= @answer.id %>").removeClass("panel-default");
$("#answer_<%= @answer.id %>").addClass("panel-success");
alert("You have approved this answer");