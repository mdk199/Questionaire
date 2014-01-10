class HomeController < ApplicationController
	skip_before_filter :authenticate_user!
	
	def index
      set_tab :home
  	end
  	
	def about_us
	  set_tab :about_us
	end

	def contact_us
	  set_tab :contact_us
	end
    
end
