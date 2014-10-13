class NewslettersController < ApplicationController
  def index
    @newsletters = Newsletter.all
    @current = Newsletter.current
  end

end
