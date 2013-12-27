$("#approve_<%= @answer.id %>").attr('style','color:red;');
$("#approve_<%= @answer.id %>").attr('href','/answers/<%= @answer.id %>/unapprove');
alert("You have approved this answer");