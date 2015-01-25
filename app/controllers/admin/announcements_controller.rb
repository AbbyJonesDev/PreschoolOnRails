class Admin::AnnouncementsController < Admin::DashboardController
  def index
    load_index_variables
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      flash[:notice] = "Announcement created successfully"
      redirect_to admin_announcement_path(@announcement)
    else
      load_index_variables
      render :index
    end
  end

  def edit
    @announcement = Announcement.find(params[:id])
    load_index_variables
    render :index
  end

  def update
    @announcement = Announcement.find(params[:id])
    if @announcement.update(announcement_params)
      flash[:notice] = "Announcement updated successfully"
      redirect_to admin_announcement_path(@announcement)
    else
      load_index_variables
      render :index
    end
  end

  def destroy
    announcement = Announcement.find(params[:id])
    announcement.destroy
    flash[:notice] = "Announcement deleted"
    # Load variables for index
    load_index_variables
    render :index
  end

  private

  def announcement_params
    params.require(:announcement).permit( :name, 
                                          :message, 
                                          :all_classes, 
                                          :expires_on, 
                                          :klasses => [])
  end

  def load_index_variables
    @announcement ||= Announcement.new
    @announcements = Announcement.order(expires_on: :asc)
    @klasses = Group.names_and_ids # hash of names and ids
  end
end
