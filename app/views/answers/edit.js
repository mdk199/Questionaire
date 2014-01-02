alert("<%= @answer.question%>");

$("#answer_<%= @answer.id %>").replaceWith("<%= escape_javascript(render 'answers/form', :question=>@answer.question) %>");