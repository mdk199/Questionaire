module QuestionsHelper
  def question_actions(user, question)
    if user.present?
      html = []
      html << "<span class='action_links float-right'>"
  		if question.user_id == user.id || user.is_admin?
        	html << link_to('', edit_question_path(question), :title => "Edit", :class=>'icon-edit')
        	html << link_to('', question, method: :delete, :title => "Delete", :class=>'icon-remove', data: { confirm: 'Are you sure?',:remote=>true })
    	    if Question.already_published(question)
            html << link_to('', unpublish_question_path(question),:title => "Unpublish",:id=>"publish_#{question.id}", :class=>'icon-ban-circle', :remote=>true )
          else
            html << link_to('', publish_question_path(question),:title => "Publish",:id=>"publish_#{question.id}", :class=>'icon-globe', :remote=>true )
          end
      else
        	if Flag.already_flagged(question, user)
          		html << link_to("", unflag_question_path(question), :remote => true, :class => "icon-flag", :style => "color:red;" , :id=>"flag_#{question.id}")
        	else
          		html << link_to("", flag_question_path(question), :remote => true, :class => "icon-flag" ,:id=>"flag_#{question.id}")
        	end
    	end
      html << "</span>"
    	raw html.join(" ")
      
    end
  end
end
