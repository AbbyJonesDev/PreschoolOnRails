def login(user)
  visit "/"
  within("ul.desktop-nav") { click_on "Parents" }
  fill_in("Email", with: user.email)
  fill_in("Password", with: user.password)
  click_on "Log in"
end

def login_admin
  admin = FactoryGirl.create(:user, role: "admin", password: "password")
  visit new_user_session_path
  fill_in("Email", with: admin.email)
  fill_in("Password", with: "password")
  click_on("Log in")
end

def fill_in_basic_user_fields
  fill_in("First Name", with: "Harriette")
  fill_in("Last Name", with: "Winslow")
  choose("user_active_true") #Radio button - Active
  fill_in("Email", with: "hwinslow@example.com")
  select("#{Group.last.name}", from: "group_ids[]")
end