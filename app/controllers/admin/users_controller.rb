class Admin::UsersController < Admin::DashboardController
  def index
    @user = User.new
    @parents = User.where(role: "parent")
  end

  def edit
    @user = User.find(params[:id])
  end
end
