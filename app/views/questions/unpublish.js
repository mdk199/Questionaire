window.location.reload();
alert("your question is unpublished");
$("#publish_<%= @question.id %>").attr('class','icon-globe');
$("#publish_<%= @question.id %>").attr('href','/questions/<%=@question.id%>/publish');