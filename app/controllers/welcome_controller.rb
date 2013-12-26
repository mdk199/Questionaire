class WelcomeController < ApplicationController
  layout "dashboard"

	def index
		@questions = Question.where(:user_id=>current_user.id).order(:answers_count=>"DESC").limit(5).includes(:answers)
		@expertise_questions = current_user.my_expertise_questions
	end
end