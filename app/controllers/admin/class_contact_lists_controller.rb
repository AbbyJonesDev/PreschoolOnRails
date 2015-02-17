class Admin::ClassContactListsController < Admin::DashboardController
  def index
    load_index_variables
  end

  def create
    @class_contact_list = ClassContactList.new(class_contact_list_params)
    old_list = ClassContactList.where("group_id = ?", params[:group_id])
    if @class_contact_list.save
      old_list.destroy
      flash[:notice] = "Class Contact List uploaded successfully"
      redirect_to admin_class_contact_lists_path
    else
      load_index_variables
      render :index
    end
  end

  def edit
    @class_contact_list = ClassContactList.find(params[:id])
    load_index_variables
    render :index
  end

  def update
    @class_contact_list = ClassContactList.find(params[:id])
    old_list = ClassContactList.where("group_id = ?", params[:group_id])
    if @class_contact_list.update(class_contact_list_params)
      old_list.destroy unless @class_contact_list == old_list
      flash[:notice] = "Class Contact List updated successfully"
      redirect_to admin_class_contact_lists_path
    else
      load_index_variables
      render :index
    end
  end

  def destroy
    class_contact_list = ClassContactList.find(params[:id])
    class_contact_list.destroy
    flash[:notice] = "Class Contact List deleted"
    load_index_variables
    render :index
  end

  private

  def class_contact_list_params
    params.require(:class_contact_list).permit(:title, :group_id, :file)
  end

  def load_index_variables
    @class_contact_list ||= ClassContactList.new
    @class_contact_lists = ClassContactList.all
  end
end