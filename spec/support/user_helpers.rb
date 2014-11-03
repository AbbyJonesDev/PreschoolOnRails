def login(user)
  visit "/"
  within("ul.desktop-nav") { click_on "Parents" }
  fill_in("Email", with: user.email)
  fill_in("Password", with: user.password)
  click_on "Log in"
end

def login_admin
  admin = FactoryGirl.create(:user, role: "admin")
  visit new_user_session_path
  fill_in("Email", with: admin.email)
  fill_in("Password", with: admin.password)
  click_on("Log in")
end