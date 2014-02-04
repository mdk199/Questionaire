class ApplicationController < ActionController::Base
  before_filter :authenticate_user!

  include PublicActivity::StoreController

  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      if resource_name == :agent && action_name == 'new'
        nil
      elsif resource_name == :admin && action_name == 'new'
        nil
      else
        'devise'
      end
    else
      'application'
    end
  end

  rescue_from 'CanCan::AccessDenied' do |exception|
    respond_to do |format|
      format.html do
        flash[:error] = exception.message
        redirect_to welcome_path
      end
      format.js { render :js => "alert('#{exception.message}');" }
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    welcome_path
  end
end
