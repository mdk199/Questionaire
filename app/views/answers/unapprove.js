$("#approve_<%= @answer.id %>").replaceWith('<%= escape_javascript(link_to("", approve_answer_path(@answer), :title => "Approve", :remote => true, :class => "icon-ok" , :style => "color:red;", :id=>"approve_#{@answer.id}")) %>');
$("#answer_<%= @answer.id %>").removeClass("panel-success");
$("#answer_<%= @answer.id %>").addClass("panel-default");
$("#see_solution").attr('href','#');
alert("You have removed the approval of this answer");

