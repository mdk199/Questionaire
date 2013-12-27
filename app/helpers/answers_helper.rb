module AnswersHelper
  def answer_actions(user, answer)
    html = []
    if answer.user.id == user.id
      html << link_to('', edit_answer_path(answer), :title => "Edit", :class=>'icon-edit')
      html << link_to('', answer, method: :delete, :title => "Delete", :class=>'icon-remove', data: { confirm: 'Are you sure?' }, :remote => true)
    end
    raw html.join(" ")
  end
end
