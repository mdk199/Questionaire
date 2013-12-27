module QuestionsHelper
  	def question_actions(user, question)
    	html = []
		if question.user_id == user.id
        	html << link_to('', edit_question_path(question), :title => "Edit", :class=>'icon-edit')
        	html << link_to('', question, method: :delete, :title => "Delete", :class=>'icon-remove', data: { confirm: 'Are you sure?',:remote=>true })
    	else
        	if Flag.already_flagged(question, user)
          		html << link_to("", unflag_question_path(question), :remote => true, :class => "icon-flag", :style => "color:red;" , :id=>"flag_#{question.id}")
        	else
          		html << link_to("", flag_question_path(question), :remote => true, :class => "icon-flag" ,:id=>"flag_#{question.id}")
        	end
    	end
  		raw html.join(" ")
  	end
end
