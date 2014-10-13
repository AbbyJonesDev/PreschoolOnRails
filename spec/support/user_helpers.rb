def login(user)
  visit "/"
  within("ul.desktop-nav") { click_on "Parents" }
  fill_in("Email", with: user.email)
  fill_in("Password", with: user.password)
  click_on "Log in"
end