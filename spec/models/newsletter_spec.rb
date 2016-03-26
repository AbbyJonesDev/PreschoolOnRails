# == Schema Information
#
# Table name: newsletters
#
#  id                :integer          not null, primary key
#  date              :datetime
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  email_sent        :boolean          default(FALSE)
#

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
