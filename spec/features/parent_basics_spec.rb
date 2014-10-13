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


end