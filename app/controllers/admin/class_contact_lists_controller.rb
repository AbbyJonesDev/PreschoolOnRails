class Admin::ClassContactListsController < Admin::DashboardController
  def index
    load_contact_lists
  end

  def edit
    @class_contact_list = ClassContactList.find(params[:id])
    load_contact_lists
  end

  def update
    @class_contact_list = ClassContactList.find(params[:id])
    if @class_contact_list.update(class_contact_list_params)
      flash[:notice] = "Class Contact List updated successfully"
      redirect_to admin_class_contact_lists_path
    else
      load_contact_lists
      render :edit
    end
  end

  private

  def class_contact_list_params
    params.require(:class_contact_list).permit(:file)
  end

  def load_contact_lists
    @class_contact_lists = ClassContactList.all.includes(:group)
  end
end