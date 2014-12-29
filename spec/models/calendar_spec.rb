require 'rails_helper'

RSpec.describe Calendar, :type => :model do
  it { should have_attached_file(:calendar_file) }
  it { should validate_attachment_presence(:calendar_file) }
  it { should validate_attachment_content_type(:calendar_file).allowing('application/pdf') }
  it { should validate_presence_of(:title) }

  describe '#most_current' do
    it "returns most recently updated calendar with current flag" do
      older = FactoryGirl.create(:calendar, current: true, updated_at: Time.now - 2.weeks)
      current = FactoryGirl.create(:calendar, current: true, updated_at: Time.now - 2.days)
      other = FactoryGirl.create(:calendar, current: false, updated_at: Time.now)
      expect(Calendar.most_current).to eq(current)
    end
  end
end
