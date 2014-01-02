class UsersController < ApplicationController
	layout "main.html.erb"

	def index
    	@users = User.all
  	end
	
	def edit
  	end
	
	def expertise
		@expertise = User.find(current_user.id).expertise_list
		respond_to do |format|
      		format.html # new.html.erb
      		format.json { render json: @expertise }
    	end
	end
end
