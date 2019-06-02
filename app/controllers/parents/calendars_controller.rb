class Parents::CalendarsController < ApplicationController
  before_action :authenticate_user!

  def show
    @calendar = Calendar.last
    render template: 'static_pages/calendar'
  end
end
