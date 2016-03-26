# == Schema Information
#
# Table name: calendars
#
#  id                         :integer          not null, primary key
#  calendar_file_file_name    :string
#  calendar_file_content_type :string
#  calendar_file_file_size    :integer
#  calendar_file_updated_at   :datetime
#  created_at                 :datetime
#  updated_at                 :datetime
#  year                       :string
#

require 'rails_helper'

RSpec.describe Calendar, :type => :model do
  it { should have_attached_file(:calendar_file) }
  it { should validate_attachment_presence(:calendar_file) }
  it { should validate_attachment_content_type(:calendar_file).allowing('application/pdf') }
  it { should validate_presence_of(:year) }
end
