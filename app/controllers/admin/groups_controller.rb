class Admin::GroupsController < Admin::DashboardController

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "Class successfully created"
      redirect_to admin_classes_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "Class successfully updated"
      redirect_to admin_classes_path
    else
      render :edit
    end
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

end
