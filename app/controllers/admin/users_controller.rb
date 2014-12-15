class Admin::UsersController < Admin::DashboardController
  def index
    @user = User.new 
    @parents = User.where(role: "parent")
    @students = Student.all
    @groups = Group.all
  end

  def create
    @user = User.new(user_params)
    @user.password = Devise.friendly_token unless params[:user][:password]
    if @user.save
      flash[:notice] = "Parent account successfully added"
      redirect_to admin_parents_path
    else
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :active, :password, :group_ids => [])
  end
end



# Use Devise.friendly_token to auto generate a default password
# Set default password in create action if none is specified in params
# Make password field hidden - accessible by clicking link to view

# Check Devise docs for how to add additional user field