class Parents::PeekAndVocabsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @peeks = PeekAndVocab.order(date: :desc)
  end

  def current_peek
    @newest_peek = PeekAndVocab.last
  end

  def current_vocab
    @newest_peek = PeekAndVocab.last
  end

  def show_peek
    @peek = PeekAndVocab.find(params[:id])
  end

  def show_vocab
    @peek = PeekAndVocab.find(params[:id])
  end
  
end
