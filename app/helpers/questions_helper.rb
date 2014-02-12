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

  def question_index_heading(path,tags)
    html = []
    if tags.present?
      html << "<b>Listing Questions tagged with #{tags.name.upcase}</b>"
    elsif path== "/questions/expertise"
      html << "<b>Listing Questions on your expertise : </b>"
      current_user.expertise_list.split(",") do |tag|
       tag_path = Tag.find_by_name(tag).id
       html << "<a href='/questions/tagged/#{tag_path}'><span class='label label-success'><i class='icon-tags'></i>#{tag.titleize}</span></a>&nbsp;"
      end 
    elsif path== "/questions/interest"
      html << "<b>Listing Questions on your Interest : </b>"
      current_user.interest_list.split(",") do |tag|
        tag_path = Tag.find_by_name(tag).id
        html << "<a href='/questions/tagged/#{tag_path}'><span class='label label-success'><i class='icon-tags'></i>#{tag.titleize}</span></a>&nbsp;"
      end
    elsif path== "/questions/blocked"
      html << "<b>Listing Blocked Questions</b>"
    else
      html << "<b>Listing Questions </b>"
    end
      raw html.join()
  end

  def question_index_buttons(path)
    html = []
    if path== "/questions/blocked"
    else
      html << button_to('+ Add Question', new_question_path, "data-disable-with" => "Please wait...", :title => "New Question", :class=>'btn btn-success btn-mini float-right top-margin', :method => :get)
    end  
    raw html.join()
  end

  def question_answer_privileges(user,question)
    html = []
    if user.present? 
      path = add_answer_question_path(question) 
      getremote = true
    else
      path = new_user_session_path
      getremote = false
    end

    html << button_to('+ Add Answer', path ,:remote=> getremote,:class=>'btn btn-primary btn-mini addbtn', :id=>"add_answer_#{question.id}",:method=>:get)
    raw html.join()
  end

end