class Parents::ClassContactListsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show
    @list = ClassContactList.find(params[:id])
  end
end
