class Parents::HandbooksController < ApplicationController
  before_filter :authenticate_user!

  def show
    @handbook = Handbook.last
    render template: 'static_pages/handbook'
  end
end
