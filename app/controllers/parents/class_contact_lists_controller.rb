class Parents::ClassContactListsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @groups = Group.joins(:parents).
      where('class_parents.user_id = ?', current_user).
      includes(:class_contact_list)
    # Most parents will only belong to one group
    if @groups.length == 1
      @list = @groups[0].class_contact_list
      render :show
    end
  end

  def show
    @list = ClassContactList.find(params[:id])
  end
end
