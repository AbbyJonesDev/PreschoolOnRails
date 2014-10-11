namespace :db do
  desc "Populate database with demo users and etc"
  task seed_demo: :environment do
    clean_db
    create_users
  end


  ##  Newsletters done in a separate step to avoid
  ##  making unnecessary repeat calls to AWS
  desc "Create demo newsletters"
  task seed_newsletters :environment do
    Newsletter.destroy_all
    create_newsletters
  end
end

def clean_db
  User.destroy_all
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

def create_newsletters
  Newsletter.create(date: Time.now - 3.weeks,
    file: File.new("#{Rails.root}/tmp/summer_camp.pdf")
    )
  Newsletter.create(date: Time.now - 2.weeks,
    file: File.new("#{Rails.root}/tmp/summer_camp.pdf")
    )
  Newsletter.create(date: Time.now - 1.weeks,
    file: File.new("#{Rails.root}/tmp/summer_camp.pdf")
    )
end