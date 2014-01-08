class ApplicationController < ActionController::Base
  layout 'devise'
  before_filter :authenticate_user!

  rescue_from 'CanCan::AccessDenied' do |exception|
    respond_to do |format|
      format.html do
        flash[:error] = exception.message
        redirect_to :root
      end
      format.js { render :js => "alert('#{exception.message}');" }
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    welcome_path
  end
end
