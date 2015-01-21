class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :admin_logged_in?

  def admin_logged_in?
    current_user && current_user.role == "admin"
  end
  
  protected

  def after_sign_in_path_for(resource)
    if resource.role == "admin"
      admin_root_path
    else
      parents_root_path
    end
  end
end