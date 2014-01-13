$('#add_answer_<%= @question.id%>').attr('disabled', true);
$ ('#answers_<%= @question.id%>').append("<%=escape_javascript(render 'answers/form', :question => @question)%>" )
