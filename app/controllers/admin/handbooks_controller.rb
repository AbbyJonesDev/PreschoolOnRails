class Admin::HandbooksController < Admin::DashboardController
  def index
    @handbook = Handbook.last
    if @handbook == nil
      redirect_to new_admin_handbook_path
    end
  end

  def new
    @handbook = Handbook.new
  end

  def create
    @handbook = Handbook.new(handbook_params)
    if @handbook.save
      flash[:notice] = "Handbook uploaded successfully"
      redirect_to admin_handbooks_path
    else
      render :new
    end
  end

  def edit
    @handbook = Handbook.find(params[:id])
    render :index
  end

  def update
    @handbook = Handbook.find(params[:id])
    if @handbook.update(handbook_params)
      flash[:notice] = "Handbook updated successfully"
      redirect_to admin_handbooks_path
    else
      render :index
    end
  end

  private

  def handbook_params
    params.require(:handbook).permit(:year, :file)
  end

end