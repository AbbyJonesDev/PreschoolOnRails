require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!  # login_as(parent, :scope => :user)


describe "Parent Basics" do
  let!(:parent) { FactoryGirl.create(:user) }
  let!(:news1)  { FactoryGirl.create(:newsletter) }
  let!(:news2)  { FactoryGirl.create(:newsletter) }

  it "takes parent to newsletter when they log in" do
    login(parent)
    expect(current_path).to eq(newsletters_path)
  end

  context "with parent logged in" do
    before { login(parent) }

    it "has no dashboard link for parents" do
      expect(page).not_to have_link("Dashboard")
    end
  end

end