class ApplicationController < ActionController::Base
layout 'devise'
 before_filter :authenticate_user!
end
