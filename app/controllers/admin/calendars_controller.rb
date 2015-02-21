class Admin::CalendarsController < Admin::DashboardController
  def index
    @calendar = Calendar.last
    if @calendar == nil
      redirect_to new_admin_calendar_path
    end
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      flash[:notice] = "Calendar uploaded successfully"
      redirect_to admin_calendars_path
    else
      render :new
    end
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_params)
      flash[:notice] = "Calendar updated successfully"
      redirect_to admin_calendars_path
    else
      render :index
    end
  end

  private

  def calendar_params
    params.require(:calendar).permit(:year, :calendar_file)
  end

end