require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!  # login_as(parent, :scope => :user)

describe "Admin Dashboard" do 
  # Access control tested in controller spec

  it "takes admin to dashboard when they log in" do
    login_admin
    expect(current_path).to eq(admin_dashboard_path)
  end
 
  context "with admin logged in" do
    before { login_admin }

    it "has link to dashboard in footer" do
      expect(page).to have_link("Dashboard", href: admin_dashboard_path)
    end
    
  end

end