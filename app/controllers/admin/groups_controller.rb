class Admin::GroupsController < Admin::DashboardController

  def index
    load_index_variables
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "Class successfully created"
      redirect_to admin_classes_path
    else
      load_index_variables
      render :index
    end
  end

  def edit
    @group = Group.find(params[:id])
    load_index_variables
    render :index
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "Class successfully updated"
      redirect_to admin_classes_path
    else
      load_index_variables
      render :index
    end
  end    

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = "#{@group.name} has been deleted"
      redirect_to admin_classes_path
  end


  private
    def group_params
      params.require(:group).permit(:name, 
                                    :start_time,
                                    :end_time,
                                    :student_ids => [],
                                    :parent_ids => [],
                                    :days => [])
    end

    def load_index_variables
      @groups = Group.all
      @group ||= Group.new
    end

end
