require 'rails_helper'

RSpec.describe User, :type => :model do

  describe '#parents' do
    let(:parent) { FactoryGirl.create(:user, role: "parent") }
    let(:admin)  { FactoryGirl.create(:user, role: "admin")  }
    
    xit "only returns users who are parents" do
      expect(User.parents).to eq([parent])
    end
  end
end
