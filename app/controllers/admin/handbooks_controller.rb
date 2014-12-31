class Admin::HandbooksController < Admin::DashboardController
  def index
    load_index_variables
  end

  def create
    @handbook = Handbook.new(handbook_params)
    if @handbook.save
      flash[:notice] = "Handbook uploaded successfully"
      redirect_to admin_handbooks_path
    else
      load_index_variables
      render :index
    end
  end

  def edit
    @handbook = Handbook.find(params[:id])
    load_index_variables
    render :index
  end

  def update
    @handbook = Handbook.find(params[:id])
    if @handbook.update(handbook_params)
      flash[:notice] = "Handbook updated successfully"
      redirect_to admin_handbooks_path
    else
      load_index_variables
      render :index
    end
  end

  def destroy
    handbook = Handbook.find(params[:id])
    handbook.destroy
    flash[:notice] = "Handbook deleted"
    # Load variables for index
    load_index_variables
    render :index
  end

  private

  def handbook_params
    params.require(:handbook).permit(:title, :current, :file)
  end

  def load_index_variables
    @handbook ||= Handbook.new
    @current_handbook = Handbook.most_current
    @handbooks = Handbook.order(updated_at: :desc)
  end
end