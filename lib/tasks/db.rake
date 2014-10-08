namespace :db do
  desc "Populate database with demo users and etc"
  task seed_demo: :environment do
    # Create an admin user
    User.create(fname: "Mrs", lname: "Smith", email: "admin@pretend.preschool",
      password: "adminadmin", role: "admin", active: true, confirmed_at: Time.now)
    # Create a teacher user
    User.create(fname: "Ms", lname: "Jones", email: "teacher@pretend.preschool",
      password: "teacher1", role: "teacher", active: true, confirmed_at: Time.now)
    # Create a parent user
    User.create(fname: "Sally", lname: "Malone", email: "parent@pretend.preschool",
      password: "parent12", role: "parent", active: true, confirmed_at: Time.now)
  end

end
