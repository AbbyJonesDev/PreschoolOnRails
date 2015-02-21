class Parents::ClassContactListsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @klasses = current_user.groups.includes(:class_contact_list)
    @lists = []
    @klasses.each do |k|
      @lists << k.class_contact_list
    end
  end
end
