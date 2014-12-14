class Admin::UsersController < Admin::DashboardController
  def index
    @user = User.new 
    @parents = User.where(role: "parent")
    @students = Student.all
    @groups = Group.all
  end

  def edit
    @user = User.find(params[:id])
  end
end



# Use Devise.friendly_token to auto generate a default password
# Set default password in create action if none is specified in params
# Make password field hidden - accessible by clicking link to view

# Check Devise docs for how to add additional user field