namespace :db do
  desc "Populate database with demo users and etc"
  task seed_demo: :environment do
    clean_db
    create_users
    create_groups
  end


  ##  Newsletters done in a separate step to avoid
  ##  making unnecessary repeat calls to AWS
  desc "Create demo newsletters"
  task seed_newsletters: :environment do
    Newsletter.destroy_all
    create_newsletters
  end
end

def clean_db
  User.destroy_all
  Group.destroy_all
end

def create_users
  # Create an admin user
  User.create(fname: "Mrs", lname: "Smith", email: "admin@pretend.preschool",
    password: "adminadmin", role: "admin", active: true, confirmed_at: Time.now)
  # Create a teacher user
  User.create(fname: "Ms", lname: "Jones", email: "teacher@pretend.preschool",
    password: "teacher1", role: "teacher", active: true, confirmed_at: Time.now)
  # Create a batch of parent users
  10.times do |i|
    User.create(fname: "Mom", lname: "Malone", email: "parent+#{i}@pretend.preschool",
      password: "parent#{i}#{i}", role: "parent", active: true, confirmed_at: Time.now)
  end
end

def create_groups
  Group.create(name: "MWF Morning", days: "Monday, Wedneday, Friday", 
    start_time: Time.new(2014, 8, 25, 8, 30, 0, "-06:00"),
    end_time: Time.new(2014, 8, 25, 11, 30, 0, "-06:00")
    )
  Group.create(name: "TTH Morning", days: "Tuesday, Thursday", 
    start_time: Time.new(2014, 8, 25, 8, 30, 0, "-06:00"),
    end_time: Time.new(2014, 8, 25, 11, 30, 0, "-06:00")
    )
  Group.create(name: "Afternoon", days: "Monday through Thursday", 
    start_time: Time.new(2014, 8, 25, 12, 30, 0, "-06:00"),
    end_time: Time.new(2014, 8, 25, 15, 30, 0, "-06:00")
    )
end

def create_newsletters
  Newsletter.create(date: Time.now - 3.weeks,
    file: File.new("#{Rails.root}/db/summer_camp.pdf")
    )
  Newsletter.create(date: Time.now - 2.weeks,
    file: File.new("#{Rails.root}/db/summer_camp.pdf")
    )
  Newsletter.create(date: Time.now - 1.weeks,
    file: File.new("#{Rails.root}/db/summer_camp.pdf")
    )
end