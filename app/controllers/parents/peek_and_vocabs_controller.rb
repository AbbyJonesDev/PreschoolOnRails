class Parents::PeekAndVocabsController < ApplicationController
  before_filter :authenticate_user!
  
  def current
    @newest_peek = PeekAndVocab.newest
  end

  def index
    @peeks = PeekAndVocab.order(date: :desc)
  end

  def show
    @peek = PeekAndVocab.find(params[:id])
  end
end
