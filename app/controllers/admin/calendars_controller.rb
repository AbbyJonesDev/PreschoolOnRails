class Admin::CalendarsController < Admin::DashboardController
  def index
    load_index_variables
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      flash[:notice] = "Calendar uploaded successfully"
      redirect_to admin_calendars_path
    else
      load_index_variables
      render :index
    end
  end

  def edit
    @calendar = Calendar.find(params[:id])
    load_index_variables
    render :index
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_params)
      flash[:notice] = "Calendar updated successfully"
      redirect_to admin_calendars_path
    else
      load_index_variables
      render :index
    end
  end

  def destroy
    calendar = Calendar.find(params[:id])
    calendar.destroy
    flash[:notice] = "Calendar deleted"
    # Load variables for index
    load_index_variables
    render :index
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title, :current, :calendar_file)
  end

  def load_index_variables
    @calendar ||= Calendar.new
    @current_calendar = Calendar.most_current
    @calendars = Calendar.order(updated_at: :desc)
  end
end
