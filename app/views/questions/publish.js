$("#publish_<%= @question.id %>").attr('class','icon-ban-circle');
$("#publish_<%= @question.id %>").attr('href','/questions/<%= @question.id %>/unpublish');
alert("your question is published");