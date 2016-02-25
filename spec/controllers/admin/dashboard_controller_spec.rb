require 'rails_helper'

RSpec.describe Admin::DashboardController, :type => :controller do

  describe "access control" do
    it "redirects to home with no user logged in" do
      allow(controller).to receive(:current_user).and_return(nil)
      get :home
      assert_redirected_to root_path
    end

    it "redirects to peek for non-admins" do
      parent = FactoryGirl.build(:user)
      allow(controller).to receive(:current_user).and_return(parent)
      get :home
      assert_redirected_to parents_curriculum_current_peek_path
    end
    
    it "allows access for admins" do
      admin = FactoryGirl.build(:user, role: "admin")
      allow(controller).to receive(:current_user).and_return(admin)
      get :home
      assert :success
    end
  end

  # MOVE USERS INTO RESTFUL CONTROLLER
  # describe "manage users" do
  #   it "gets user index" do
  #     get :user_index
  #     assert :success
  #   end

  #   it "populates users" do
  #     users = []
  #     3.times do
  #       users << FactoryGirl.build(:user) 
  #     end
  #     expect(assigns[:users]).to eq(users)
  #     get :user_index
  #   end
  # end

end
