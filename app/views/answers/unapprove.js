alert("You have removed the approval of this answer");
$("#approve_<%= @answer.id %>").attr('style','');
$("#approve_<%= @answer.id %>").attr('href','/answers/<%=@answer.id%>/answer');