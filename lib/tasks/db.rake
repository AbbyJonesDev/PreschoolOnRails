namespace :db do
  desc "Populate database with demo users and etc"
  task seed_demo: :environment do
    clean_db
    # Groups must be created before users
    # to set up associations
    create_groups
    create_users
  end

  ##  Newsletters done in a separate step to avoid
  ##  making unnecessary repeat calls to AWS
  desc "Create demo newsletters"
  task seed_newsletters: :environment do
    create_newsletters
  end

  ##  Calendars done in a separate step to avoid
  ##  making unnecessary repeat calls to AWS
  desc "Create demo calendars"
  task seed_calendars: :environment do
    create_calendars
  end

  ##  Seed all 4 types of docs at one time
  desc "Create all 4 types of docs"
  task seed_docs: :environment do
    create_newsletters
    create_calendars
    create_handbooks  
    create_registration_forms
  end
end


def clean_db
  User.destroy_all
  Group.destroy_all
end

def create_groups
  Group.create(name: "MWF Morning", days: ["Monday", "Wedneday", "Friday"], 
    start_time: Time.new(2014, 8, 25, 8, 30, 0, "-06:00"),
    end_time: Time.new(2014, 8, 25, 11, 30, 0, "-06:00")
    )
  Group.create(name: "TTH Morning", days: ["Tuesday", "Thursday"], 
    start_time: Time.new(2014, 8, 25, 8, 30, 0, "-06:00"),
    end_time: Time.new(2014, 8, 25, 11, 30, 0, "-06:00")
    )
  Group.create(name: "Afternoon", days: ["Monday", "Tuesday", "Wedneday", "Thursday"], 
    start_time: Time.new(2014, 8, 25, 12, 30, 0, "-06:00"),
    end_time: Time.new(2014, 8, 25, 15, 30, 0, "-06:00")
    )
end

def create_users
  # Create an admin user
  User.create(fname: "Mrs", lname: "Smith", email: "admin@pretend.preschool",
    password: "adminadmin", role: "admin", active: true, confirmed_at: Time.now)
  # Create a teacher user
  User.create(fname: "Ms", lname: "Jones", email: "teacher@pretend.preschool",
    password: "teacher1", role: "teacher", active: true, confirmed_at: Time.now)
  # Create a batch of parent users
  10.times do
    User.create(  fname: Faker::Name.first_name,
                  lname: Faker::Name.last_name,
                  email: Faker::Internet.safe_email,
                  password: "parentpassword", 
                  role: "parent", 
                  active: true, 
                  confirmed_at: Time.now)
  end
  # Create a batch of students
  20.times do
    Student.create( fname: Faker::Name.first_name,
                    lname: Faker::Name.last_name )
  end
  # Build class associations
  klasses = []
  Group.all.each { |g| klasses << g }
  User.where(role: "parent").each { |p| p.groups << klasses.sample }
  Student.all.each { |s| s.groups << klasses.sample }
end


def create_newsletters
  Newsletter.destroy_all
  Newsletter.create(date: Time.now,
    file: File.new("#{Rails.root}/db/docs/Sample_Newsletter.pdf")
    )
end

def create_calendars
  Calendar.destroy_all
  Calendar.create(title: "2014-2015 Calendar",
    current: true,
    calendar_file: File.new("#{Rails.root}/db/docs/2014-15 Calendar.pdf")
    )
end

def create_registration_forms
  RegistrationForm.destroy_all
  RegistrationForm.create(title: "2014-2015 Registration",
    current: true,
    file: File.new("#{Rails.root}/db/docs/2014-15 Registration.pdf")
    )
end

def create_handbooks
  Handbook.destroy_all
  Handbook.create(title: "2014-2015 Handbook",
    current: true,
    file: File.new("#{Rails.root}/db/docs/HereWeGrowHandbook.pdf")
    )
end