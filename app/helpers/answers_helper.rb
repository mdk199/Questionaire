module AnswersHelper
  def answer_actions(user, answer)
    html = []
   	if answer.user.id == user.id
   		html << link_to('', edit_answer_path(answer), :title => "Edit", :class=>'icon-edit')
   		html << link_to('', answer, method: :delete, :title => "Delete", :class=>'icon-remove', data: { confirm: 'Are you sure?' }, :remote => true)
   	end
   	if answer.question.user.id == user.id
  		html << link_to('', answer, method: :delete, :title => "Delete", :class=>'icon-remove', data: { confirm: 'Are you sure?' }, :remote => true)
      if answer.approved==false
        html << link_to("", approve_answer_path(answer), :remote => true, :class => "icon-ok", :style => "color:red;" , :id=>"approve_#{answer.id}")
      else
        html << link_to("", unapprove_answer_path(answer), :remote => true, :class => "icon-ok" ,:id=>"approve_#{answer.id}")
      end 
	  end    	
    raw html.join(" ")
  end
end
