namespace :db do
  desc "Populate database with demo users and etc"
  task seed_users: :environment do
    clean_db
    # Groups must be created before users
    # to set up associations
    create_groups
    create_users
  end

  ##  Seed docs in separate steps to avoid
  ##  making unnecessary repeat calls to AWS
  desc "Create general docs"
  task seed_docs: :environment do
    create_calendar
    create_handbook  
    create_registration_form
  end
end


def clean_db
  User.destroy_all
  Group.destroy_all
end

def create_groups
  Group.create(name: "MWF Morning", days: ["Monday", "Wednesday", "Friday"], 
    start_time: Time.new(2014, 8, 25, 8, 30, 0, "-06:00"),
    end_time: Time.new(2014, 8, 25, 11, 30, 0, "-06:00")
    )
  Group.create(name: "TTH Morning", days: ["Tuesday", "Thursday"], 
    start_time: Time.new(2014, 8, 25, 8, 30, 0, "-06:00"),
    end_time: Time.new(2014, 8, 25, 11, 30, 0, "-06:00")
    )
  Group.create(name: "Afternoon", days: ["Monday", "Tuesday", "Wednesday", "Thursday"], 
    start_time: Time.new(2014, 8, 25, 12, 30, 0, "-06:00"),
    end_time: Time.new(2014, 8, 25, 15, 30, 0, "-06:00")
    )
  Group.all.each do |g|
    g.create_class_contact_list
  end
end

def create_users
  # Create an admin user
  User.create(fname: "Mrs", lname: "Smith", email: "admin@pretend.preschool",
    password: "adminadmin", role: "admin", active: true, confirmed_at: Time.now)
  # Create a teacher user
  # User.create(fname: "Ms", lname: "Jones", email: "teacher@pretend.preschool",
  #   password: "teacher1", role: "teacher", active: true, confirmed_at: Time.now)
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
  # 20.times do
  #   Student.create( fname: Faker::Name.first_name,
  #                   lname: Faker::Name.last_name )
  # end

  # Build class associations
  klasses = []
  Group.all.each { |g| klasses << g }
  User.where(role: "parent").each { |p| p.groups << klasses.sample }
  # Student.all.each { |s| s.groups << klasses.sample }
end

def create_calendar
  Calendar.destroy_all
  Calendar.create(
    year: "2014-2015",
    calendar_file: File.new("#{Rails.root}/db/docs/2014-15 Calendar.pdf")
    )
end

def create_registration_form
  RegistrationForm.destroy_all
  RegistrationForm.create(
    year: "2014-2015",
    file: File.new("#{Rails.root}/db/docs/2014-15 Registration.pdf")
    )
end

def create_handbook
  Handbook.destroy_all
  Handbook.create(
    year: "2014-2015",
    file: File.new("#{Rails.root}/db/docs/HereWeGrowHandbook.pdf")
    )
end