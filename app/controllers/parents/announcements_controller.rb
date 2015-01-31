class Parents::AnnouncementsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @announcements = Announcement.for_user(current_user)
    if @announcements.length == 0
      flash[:notice] = "No announcements at this time"
      redirect_to parents_root_path and return
    end
  end
end
