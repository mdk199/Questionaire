class HomeController < ApplicationController
	skip_before_filter :authenticate_user!
	
	def index
      set_tab :home
  	end

    
end
