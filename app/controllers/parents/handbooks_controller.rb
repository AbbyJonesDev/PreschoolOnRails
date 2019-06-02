class Parents::HandbooksController < ApplicationController
  before_action :authenticate_user!

  def show
    @handbook = Handbook.last
    render template: 'static_pages/handbook'
  end
end
