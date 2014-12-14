require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

describe "Account Manager" do
  before { login_admin }

  context "On User Index Page" do
    before do
      3.times { FactoryGirl.create(:user) }
      # Build class association for one user
      User.last.groups = [ FactoryGirl.create(:group) ]
      visit admin_parents_path
    end

    it "has form to add parent" 

    it "displays table of users" do
      expect(page).to have_selector("table tr", count: 3)
    end

    it "gives class name for parent" do
      expect(page).to have_selector('td', text: "#{Group.first.name}")
    end

    it "has links to edit each user" do
      id = User.find_by_role("parent").id #Will get first one
      click_on("Edit", :match => :first)
      expect(current_path).to eq(edit_admin_parent_path(id))
    end

    it "has links to delete each user" do
      expect(page).to have_link("Delete")
    end
  end
end