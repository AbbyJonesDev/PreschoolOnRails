class StaticPagesController < ApplicationController

  def home
  end

  def about_us
    # Set class for background color
    @body_background = "light-blue-background"
  end

  def activities
    # Set class for background color
    @body_background = "blue-background"
  end

  def photo_gallery
    # Set class for background color
    @body_background = "orange-background"
  end

  def register
  end

  def schedule
    # Set class for background color
    @body_background = "orange-background"
  end

  def calendar
    @calendar = Calendar.most_current
  end

  def reg_form
    @reg_form = RegistrationForm.most_current
  end

  def handbook
    @handbook = Handbook.most_current
  end    

end
