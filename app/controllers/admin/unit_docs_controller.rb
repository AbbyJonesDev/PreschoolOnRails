class Admin::UnitDocsController < Admin::DashboardController
  def index
    @unit_doc = UnitDoc.last || UnitDoc.new
  end

  def new
    @unit_doc = UnitDoc.new
  end

  def create
    @unit_doc = UnitDoc.new(unit_doc_params)
    if @unit_doc.save
      flash[:notice] = "Document uploaded successfully"
      redirect_to admin_unit_docs_path
    else
      render :new
    end
  end

  def update
    @unit_doc = UnitDoc.find(params[:id])
    if @unit_doc.update(unit_doc_params)
      flash[:notice] = "Document updated successfully"
      redirect_to admin_unit_docs_path
    else
      render :index
    end
  end

  private

  def unit_doc_params
    params.require(:unit_doc).permit(:year, :doc)
  end

end