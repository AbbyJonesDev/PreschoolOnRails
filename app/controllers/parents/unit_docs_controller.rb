class Parents::UnitDocsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @unit_doc = UnitDoc.last
    render template: 'static_pages/unit_doc'
  end
end
