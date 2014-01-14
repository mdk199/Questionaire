$("#modal-content").html("<%=escape_javascript(render 'comments/form', :answer => @answer)%>" );
$("#modal-show").click();