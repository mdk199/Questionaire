alert("You have removed the approval of this answer");
$("#approve_<%= @answer.id %>").attr('style','color:red;');
$("#approve_<%= @answer.id %>").attr('href','/answers/<%=@answer.id%>/answer');