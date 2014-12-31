class Admin::RegistrationFormsController < Admin::DashboardController
  def index
    load_index_variables
  end

  def create
    @registration_form = RegistrationForm.new(reg_form_params)
    if @registration_form.save
      flash[:notice] = "Registration Form uploaded successfully"
      redirect_to admin_registration_forms_path
    else
      load_index_variables
      render :index
    end
  end

  def edit
    @registration_form = RegistrationForm.find(params[:id])
    load_index_variables
    render :index
  end

  def update
    @registration_form = RegistrationForm.find(params[:id])
    if @registration_form.update(reg_form_params)
      flash[:notice] = "Registration Form updated successfully"
      redirect_to admin_registration_forms_path
    else
      load_index_variables
      render :index
    end
  end

  def destroy
    reg_form = RegistrationForm.find(params[:id])
    reg_form.destroy
    flash[:notice] = "Registration Form deleted"
    # Load variables for index
    load_index_variables
    render :index
  end

  private

  def reg_form_params
    params.require(:registration_form).permit(:title, :current, :file)
  end

  def load_index_variables
    @registration_form ||= RegistrationForm.new
    @current_reg_form = RegistrationForm.most_current
    @registration_forms = RegistrationForm.order(updated_at: :desc)
  end
end