class Admin::IconsController < Admin::DashboardController
  rescue_from ActionController::ParameterMissing, with: :empty_form
  def new
    @icon = Icon.new
  end

  def create
    @icon = Icon.create(icon_params)
    if @icon.save
      flash[:notice] = "Icon created successfully"
      redirect_to admin_icons_path
    else
      render :new
    end
  end

  def index
    @icon = Icon.new
    @icons = Icon.all
  end


  private

    def icon_params
      params.require(:icon).permit(:image)
    end

    def empty_form
      redirect_to 'index'
    end
end