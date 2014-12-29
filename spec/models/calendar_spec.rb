require 'rails_helper'

RSpec.describe Calendar, :type => :model do
  it { should have_attached_file(:calendar_file) }
  it { should validate_attachment_presence(:calendar_file) }
  it { should validate_attachment_content_type(:calendar_file).allowing('application/pdf') }
  it { should validate_presence_of(:title) }
end
