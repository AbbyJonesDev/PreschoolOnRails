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
    # Dynamically set year in view link
    if RegistrationForm.last
      @year = RegistrationForm.last.year
    else
      @year = ''
    end
  end

  def schedule
    # Set class for background color
    @body_background = "orange-background"
    # Dynamically set year in view link
    if Calendar.last
      @year = Calendar.last.year
    else
      @year = ''
    end
  end

  def calendar
    @calendar = Calendar.last
  end

  def reg_form
    @reg_form = RegistrationForm.last
  end

  def handbook
    @handbook = Handbook.last
  end    

end
