class UsersController < ApplicationController
	layout "main.html.erb"

	def index
    	@users = User.all
  	end

	def update
		@user = User.find(params[:id])
			respond_to do |format|
		  	if @user.update_attributes(params[:user])
		    	format.html { redirect_to :root, notice: 'User was successfully updated.' }
		    	format.json { head :no_content }
		  	else
		    	format.html { render action: "edit" }
		    	format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end


	def expertise
		@user = User.find(params[:id])
	end

	def interest
		@user = User.find(params[:id])
	end

	def show
    	@user = User.find(params[:id])
    	respond_to do |format|
	      format.html {redirect_to :root}
    	  format.json { render json: @user }
    	end
  	end

end
