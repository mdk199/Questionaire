module AnswersHelper
  def answer_actions(user, answer)
    html = []
    if user.present? && (answer.question.user == user || answer.user == user || user.is_admin?)
      html << "<span class='action_links float-right'>"

     	if answer.question.user == user
        if answer.is_approved?
          html << link_to("", unapprove_answer_path(answer), :title => "Unapprove", :remote => true, :class => "icon-ok" , :style => "color:green;", :id=>"approve_#{answer.id}", "data-id" => answer.id)
        else
          html << link_to("", approve_answer_path(answer), :title => "Approve", :remote => true, :class => "icon-ok", :style => "color:red;" , :id=>"approve_#{answer.id}", "data-id" => answer.id)
        end 
      end     
      if answer.user == user || user.is_admin?
     		html << link_to('', edit_answer_path(answer), :title => "Edit", :class=>'icon-edit',:remote =>true)
     	end
      if answer.user == user || answer.question.user == user || user.is_admin?
        html << link_to('', answer, method: :delete, :title => "Delete", :class=>'icon-remove', data: { confirm: 'Are you sure?' }, :remote => true)
      end
      html << "</span>"
      raw html.join(" ")
    end
  end

  def answer_panel_class(answer)
    answer.is_approved? ? "panel-success" : "panel-default"
  end
end
