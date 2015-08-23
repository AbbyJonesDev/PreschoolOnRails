# First admin user should be created via console
# Be sure to associate admin user with all classes

# Set up tasks
def create_groups
  Group.create(name: "MWF Morning", days: ["Monday", "Wednesday", "Friday"], 
    start_time: Time.local(2014, 8, 25, 8, 30, 0),
    end_time: Time.local(2014, 8, 25, 11, 30, 0)
    )
  Group.create(name: "TTH Morning", days: ["Tuesday", "Thursday"], 
    start_time: Time.local(2014, 8, 25, 8, 30, 0),
    end_time: Time.local(2014, 8, 25, 11, 30, 0)
    )
  Group.create(name: "Afternoon", days: ["Monday", "Tuesday", "Wednesday", "Thursday"], 
    start_time: Time.local(2014, 8, 25, 12, 30, 0),
    end_time: Time.local(2014, 8, 25, 15, 30, 0)
    )
end

def create_calendar
  Calendar.create(
    year: "2015-2016",
    calendar_file: File.new("#{Rails.root}/db/docs/2015-2016 Calendar.pdf")
    )
end

def create_registration_form
  RegistrationForm.create(
    year: "2015-2016",
    file: File.new("#{Rails.root}/db/docs/Preschool-Registration-2015-2016.pdf")
    )
end

def create_handbook
  Handbook.create(
    year: "2015-2016",
    file: File.new("#{Rails.root}/db/docs/Here-We-Grow-Handbook-2015-2016.pdf")
    )
end

def seed_docs
  create_calendar
  create_handbook
  create_registration_form
end

# Populate Database
create_groups
seed_docs