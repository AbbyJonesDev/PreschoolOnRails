class NewslettersController < ApplicationController
  def current
    @newest_newsletter = Newsletter.newest
  end

  def archive
    @newsletters = Newsletter.order(date: :desc)
  end

end
