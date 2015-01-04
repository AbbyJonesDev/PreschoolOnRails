class NewslettersController < ApplicationController
  def current
    @newest_newsletter = Newsletter.newest
  end

  def index
    @newsletters = Newsletter.order(date: :desc)
  end

  def show
    @newsletter = Newsletter.find(params[:id])
  end
end
