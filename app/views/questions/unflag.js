alert("We have taken your request to unflag this question");
$("#flag_<%= @question.id %>").attr('style','');
$("#flag_<%= @question.id %>").attr('href','/questions/<%=@question.id%>/flag');