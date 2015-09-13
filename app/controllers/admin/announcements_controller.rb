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

  def email_announcement
    @announcement = Announcement.find(params[:id])
    begin
      NotificationsMailer.email_announcement(@announcement).deliver_now
    rescue
      flash[:warning] = "Sorry, something went wrong. Please contact your site administrator"
    else
      @announcement.update_attribute(:email_sent, true)
      flash[:notice] = "Email has been sent"
    ensure
      redirect_to admin_announcements_path
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

  def expired
    @announcements = Announcement.expired
    respond_to do |format|
      format.js
    end
  end

  def current
    @announcements = Announcement.current
    respond_to do |format|
      format.js
    end
  end


  private

  def announcement_params
    params.require(:announcement).permit( :name, 
                                          :message, 
                                          :all_classes, 
                                          :expires_on,
                                          :icon, 
                                          :group_ids => [])
  end

  def load_index_variables
    @announcement ||= Announcement.new
    @announcements = Announcement.current.order(expires_on: :asc)
    @klasses = Group.names_and_ids # hash of names and ids
  end
end
