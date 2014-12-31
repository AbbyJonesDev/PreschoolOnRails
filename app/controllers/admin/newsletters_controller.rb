class Admin::NewslettersController < Admin::DashboardController
  def index
    load_index_variables
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)
    if @newsletter.save
      flash[:notice] = "Newsletter uploaded successfully"
      redirect_to admin_newsletters_path
    else
      load_index_variables
      render :index
    end
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
    load_index_variables
    render :index
  end

  def update
    @newsletter = Newsletter.find(params[:id])
    if @newsletter.update(newsletter_params)
      flash[:notice] = "Newsletter updated successfully"
      redirect_to admin_newsletters_path
    else
      load_index_variables
      render :index
    end
  end

  def destroy
    newsletter = Newsletter.find(params[:id])
    newsletter.destroy
    flash[:notice] = "Newsletter deleted"
    # Load variables for index
    load_index_variables
    render :index
  end

  private

  def newsletter_params
    params.require(:newsletter).permit(:date, :file)
  end

  def load_index_variables
    @newsletter ||= Newsletter.new
    @current_newsletter = Newsletter.newest
    @newsletters = Newsletter.order(date: :desc)
  end
end