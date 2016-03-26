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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :calendar do
    year '2016'
    calendar_file_file_name 'calendar.pdf'
    calendar_file_content_type 'application/pdf'
    calendar_file_file_size 1024
    calendar_file_updated_at Time.now
  end
end
