class Admin::UsersController < Admin::DashboardController
  def index
    load_variables
  end

  def create
    @user = User.new(user_params)

    ### Option 1:  Create strong password if none is assigned 
    # @user.password = Devise.friendly_token unless params[:user][:password]
    ### Option 2:  Simplicity over security - have user change it
    @user.password = "password" unless params[:user][:password]
    

    if @user.save
      @user.update_klasses(params[:group_ids])
      flash[:notice] = "Parent account successfully added"
      redirect_to admin_parents_path
    else
      load_variables
      render :index
    end
  end

  def edit
    @user = User.find(params[:id])
    load_variables
    render :index
  end

  def update
    @user = User.find(params[:id])
    @user.skip_reconfirmation!
    if @user.update(user_params)
      @user.update_klasses(params[:group_ids])
      flash[:notice] = "Account updated"
      redirect_to admin_parents_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Account removed"
      redirect_to admin_parents_path
    else
      flash[:notice] = "Account not found"
      redirect_to admin_parents_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :active, :password)
  end

  def load_variables
    @user ||= User.new 
    @parents = User.where(role: "parent").includes(:groups)
    # @students = Student.all
    @groups = Group.all
  end

end