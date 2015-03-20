class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :admin_logged_in?
  before_action :set_device_type

  def admin_logged_in?
    current_user && current_user.role == "admin"
  end
  
  protected

  def after_sign_in_path_for(resource)
    if resource.role == "admin"
      admin_root_path
    elsif Announcement.for_user(resource).length == 0
      parents_peek_current_path
    else
      parents_announcements_path
    end
  end

  private 

  def set_device_type
    case request.user_agent
      when /iPad/i
        request.variant = :mobile
      when /iPhone/i
        request.variant = :mobile
      when /Android/i
        request.variant = :mobile
      when /Windows Phone/i
        request.variant = :mobile
      else
        request.variant = :desktop
    end
  end
end