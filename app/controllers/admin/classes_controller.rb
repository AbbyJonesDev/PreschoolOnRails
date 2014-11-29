class Admin::ClassesController < Admin::DashboardController

  def index
  end

  def new
    @group = Group.new
  end

  def create

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
