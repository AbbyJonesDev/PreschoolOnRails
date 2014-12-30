require 'rails_helper'

RSpec.describe Newsletter, :type => :model do

  describe '#newest' do
    it "returns the most recent newsletter" do
      past = FactoryGirl.create(:newsletter, :date => Time.now - 2.weeks)
      present = FactoryGirl.create(:newsletter, :date => Time.now)
      expect(Newsletter.newest).to eq(present)
    end
  end
end
