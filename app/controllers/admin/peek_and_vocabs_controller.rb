class Admin::PeekAndVocabsController < Admin::DashboardController
  def index
    load_index_variables
  end

  def create
    @peek = PeekAndVocab.new(peek_params)
    if @peek.save
      flash[:notice] = "Peek at Our Week uploaded successfully"
      redirect_to admin_peeks_path
    else
      load_index_variables
      render :index
    end
  end

  def edit
    @peek = PeekAndVocab.find(params[:id])
    load_index_variables
    render :index
  end

  def update
    @peek = PeekAndVocab.find(params[:id])
    if @peek.update(peek_params)
      flash[:notice] = "Peek at Our Week updated successfully"
      redirect_to admin_peeks_path
    else
      load_index_variables
      render :index
    end
  end

  def destroy
    peek = PeekAndVocab.find(params[:id])
    peek.destroy
    flash[:notice] = "Peek at Our Week deleted"
    # Load variables for index
    load_index_variables
    render :index
  end

  private

  def peek_params
    params.require(:peek_and_vocab).permit(:date, :file)
  end

  def load_index_variables
    @peek ||= PeekAndVocab.new
    @current_peek = PeekAndVocab.newest
    @peeks = PeekAndVocab.order(date: :desc)
  end
end
