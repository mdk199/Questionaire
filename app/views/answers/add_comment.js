$("#comment").attr("data-toggle","modal");
$("#comment").attr("data-target","#modal-window");
$("#modal-content").html("<%=escape_javascript(render 'comments/form', :answer => @answer)%>" );
$("#comment").click();