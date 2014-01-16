class HomeController < ApplicationController
	skip_before_filter :authenticate_user!
	
	def index
      set_tab :home
      @questions = Question.order("updated_at DESC").all_published_questions
      respond_to do |format|
	    format.html # all_question.html.erb
	    format.json { render json: @questions }
      end
  	end
  	
	def about_us
	  set_tab :about_us
	end

	def contact_us
	  set_tab :contact_us
	end

    def all_questions
    
  end
end
