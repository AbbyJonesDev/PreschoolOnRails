class Parents::CalendarsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @calendar = Calendar.last
    render template: 'static_pages/calendar'
  end
end
