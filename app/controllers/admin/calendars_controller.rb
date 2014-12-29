class Admin::CalendarsController < Admin::DashboardController
  def index
    @calendar ||= Calendar.new
    @calendars = Calendar.all
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      flash[:notice] = "Calendar uploaded successfully"
      redirect_to admin_file_uploader_path
    else
      @calendars = Calendar.all
      render template: '/admin/dashboard/file_uploader.html.erb'
    end
  end

  def edit
    @calendar = Calendar.find(params[:id])
    @calendars = Calendar.all
    render :index
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_params)
      flash[:notice] = "Calendar updated successfully"
      redirect_to admin_calendars_path
    else
      @calendars = Calendar.all
      render :index
    end
  end

  def destroy
    calendar = Calendar.find(params[:id])
    calendar.destroy
    flash[:notice] = "Calendar deleted"
    redirect_to admin_file_uploader_path
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title, :current, :calendar_file)
  end
end
