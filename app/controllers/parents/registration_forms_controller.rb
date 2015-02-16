class Parents::RegistrationFormsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @reg_form = RegistrationForm.most_current || RegistrationForm.last
    render template: 'static_pages/reg_form'
  end
end
