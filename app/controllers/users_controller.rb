class UsersController < ApplicationController
	layout "main.html.erb"

	def index
    	@users = User.all
  	end

	def update
		@user = User.find(params[:id])
			respond_to do |format|
		  	if @user.update_attributes(params[:user])
		    	format.html { redirect_to :welcome, notice: 'User was successfully updated.' }
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

 	def edit
    @user = User.find(params[:id])
 	end

 	def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash.now[:notice] = 'User was successfully removed.'
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def activity_log
  	@activities = Activity.all
  	respond_to do |format|
      format.html # activity_log.html.erb
      format.json { render json: @activities }
    end
  end

  def tag_log
    @tags = Tag.all
    respond_to do |format|
      format.html # tag_log.html.erb
      format.json { render json: @tags}
    end
  end

end
