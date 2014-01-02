var prefix = $('#add_answer_<%= @question.id%>').attr("prefix");
alert(prefix);
$ ('#'+prefix+'answers_<%= @question.id%>').append("<%=escape_javascript(render 'answers/form', :question => @question)%>" )
$('#add_answer_<%= @question.id%>').attr('disabled', true);