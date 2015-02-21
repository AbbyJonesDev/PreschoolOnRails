class Admin::RegistrationFormsController < Admin::DashboardController
  def index
    @registration_form = RegistrationForm.last
    if @registration_form == nil
      redirect_to new_admin_registration_forms_path
    end
  end

  def new
    @registration_form = RegistrationForm.new
  end

  def create
    @registration_form = RegistrationForm.new(reg_form_params)
    if @registration_form.save
      flash[:notice] = "Registration Form uploaded successfully"
      redirect_to admin_registration_forms_path
    else
      render :new
    end
  end

  def edit
    @registration_form = RegistrationForm.find(params[:id])
    render :index
  end

  def update
    @registration_form = RegistrationForm.find(params[:id])
    if @registration_form.update(reg_form_params)
      flash[:notice] = "Registration Form updated successfully"
      redirect_to admin_registration_forms_path
    else
      render :index
    end
  end

  private

  def reg_form_params
    params.require(:registration_form).permit(:year, :file)
  end

end