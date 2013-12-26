class WelcomeController < ApplicationController
  layout "dashboard"

	def index
		@questions = Question.where(:user_id=>current_user.id).order(:answers_count=>"DESC").limit(5).includes(:answers)
		@expertisequestions = current_user.my_expertise_questions
		respond_to do |format|
			format.html # index.html.erb
			format.json  { render :json => {:question => @question, :expertisequestions => @expertisequestions }}
		end
	end
end