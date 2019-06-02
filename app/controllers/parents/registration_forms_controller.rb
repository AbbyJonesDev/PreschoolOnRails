class Parents::RegistrationFormsController < ApplicationController
  before_action :authenticate_user!

  def show
    @reg_form = RegistrationForm.last
    render template: 'static_pages/reg_form'
  end
end
