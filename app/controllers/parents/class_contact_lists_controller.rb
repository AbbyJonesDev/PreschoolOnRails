class Parents::ClassContactListsController < ApplicationController
  before_filter :authenticate_user!

  def index
    # Most parents will only belong to one class and
    # only have one class contact list accessible
    # But some could belong to multiple classes
    # Currently uses current_user in the view and
    # Pulls everything else from that...
  end

  def show
    @list = ClassContactList.find(params[:id])
  end
end
