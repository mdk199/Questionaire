$("#answer_<%= @answer.id %>").replaceWith("<%= escape_javascript(render 'answers/form', :question=>@answer.question,:answer=>@answer)%>");
$('#add_answer_<%= @answer.question.id%>').attr('disabled','true');