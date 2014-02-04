class TagsController < ApplicationController
	layout "main.html.erb"

	def destroy
    	@tag = Tag.find(params[:id])
		@tag.destroy
		flash.now[:notice] = 'Tag was successfully removed.'
		respond_to do |format|
		  format.html { redirect_to tag_log_url }
		  format.json { head :no_content }
		end
	end
end