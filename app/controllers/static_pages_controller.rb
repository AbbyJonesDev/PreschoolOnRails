class StaticPagesController < ApplicationController

  def home
    # Set "current" class on link in view
    @home = true
  end

  def about_us
    # Set "current" class on link in view
    @about = true
    # Set class for background color
    @body_background = "light-blue-background"
  end

  def activities
    # Set "current" class on link in view
    @activities = true
    # Set class for background color
    @body_background = "blue-background"
  end

  def photo_gallery
    # Set "current" class on link in view
    @photo = true
    # Set class for background color
    @body_background = "orange-background"
  end

  def register
    # Set "current" class on link in view
    @reg = true
    # Set link addresses for pdf files
  end

  def schedule
    # Set "current" class on link in view
    @sched = true
    # Set class for background color
    @body_background = "orange-background"
  end

  def calendar
    @calendar_link = Calendar.most_current.calendar_file.url
  end

  def reg_form
    @reg_form_link = RegistrationForm.most_current.file.url
  end

  def handbook
    @handbook_link = Handbook.most_current.file.url
  end    

end
