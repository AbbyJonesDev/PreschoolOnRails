require 'rails_helper'
require 'support/shared_examples/admin_dashboard_controller'

RSpec.describe Admin::GroupsController, :type => :controller do
  
  it_behaves_like "admin_dashboard_controller"

  describe 'DESTROY' do
    let(:klass) { Group.first }
    before do
      admin = FactoryGirl.build(:user, role: "admin")
      allow(controller).to receive(:current_user).and_return(admin)
      2.times { FactoryGirl.create(:group) }
      delete :destroy, id: klass.id
    end

    it "removes record" do
      expect{Group.find(klass.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
    
    it "removes student associations" 

    it "redirects to class index" do
      expect(response).to redirect_to(admin_classes_url)
    end
  end

end
