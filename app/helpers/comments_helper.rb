module CommentsHelper
	def comment_actions(user, comment)
    html = []
   	
    if comment.user == user
   		html << link_to('', edit_comment_path(comment), :title => "Edit", :class=>'icon-edit',:remote =>true)
   	end
    
    if comment.user == user || comment.answer.user == user
      html << link_to('', comment, method: :delete, :title => "Delete", :class=>'icon-remove', data: { confirm: 'Are you sure?' }, :remote => true)
    end

    raw html.join(" ")
  end
end
