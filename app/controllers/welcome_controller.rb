class WelcomeController < ApplicationController
  layout "dashboard"

	def index
	@questions = Question.where(:user_id=>current_user.id).order(:answers_count=>"DESC").limit(5).find(:all, :include=>"answers")
	respond_to do |format|
		format.html # index.html.erb
		format.json { render json: @questions }
		end
	end
end