require 'rails_helper'
require 'support/shared_examples/admin_dashboard_controller'

RSpec.describe Admin::UsersController, :type => :controller do

  it_behaves_like "admin_dashboard_controller"

  describe "GET Index" do
    let(:admin) { FactoryGirl.create(:user, role: "admin") }
    let(:parent){ FactoryGirl.create(:user, role: "parent") }

    before do
      allow(controller).to receive(:current_user).and_return(admin)
      get :index
    end
      
    it "renders index" do
      expect(response).to render_template("index")
    end

    it "assigns parents" do
      expect(assigns(:parents)).to eq([parent])
    end
  end
end
