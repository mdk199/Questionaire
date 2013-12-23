$("#flag_<%= @question.id %>").attr('style','color:red;');
$("#flag_<%= @question.id %>").attr('href','/questions/<%= @question.id %>/unflag');
alert("We have taken your request to flag this question");