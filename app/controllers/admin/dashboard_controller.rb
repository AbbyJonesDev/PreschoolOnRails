class Admin::DashboardController < ApplicationController
  before_filter :authenticate_admin

def home
end

private

def authenticate_admin
  if !current_user
    flash[:notice] = "You must be logged in to perform this action"
    redirect_to root_path and return
  end
  if current_user.role != "admin"
    flash[:notice] = "You must be an administrator to perform this action"
    redirect_to newsletters_path      
  end
end

end
