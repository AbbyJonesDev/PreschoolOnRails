class Parents::AnnouncementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @announcements = Announcement.for_user(current_user)
  end
end
