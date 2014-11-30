require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!  # login_as(parent, :scope => :user)

describe "Admin Dashboard" do 
  # Access control tested in controller spec
  before { login_admin }

  describe "After Logging In" do
    it "takes admin to dashboard" do
      expect(current_path).to eq(admin_dashboard_path)
    end
   
    it "has link to dashboard from other pages" do
      visit root_path
      expect(page).to have_link("Dashboard", href: admin_dashboard_path)
    end
  end

end