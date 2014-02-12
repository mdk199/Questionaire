module CommentsHelper
	def comment_actions(user, comment)
    html = []
    if user.present? && (comment.user == user || comment.answer.user == user || user.is_admin?)
      html << link_to('', comment, method: :delete, :title => "Delete", :class=>'icon-remove', data: { confirm: 'Are you sure?' }, :remote => true)
    end

    raw html.join(" ")
  end
end
