# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :calendar do
    title "Calendar"
    current false
    calendar_file_file_name 'calendar.pdf'
    calendar_file_content_type 'application/pdf'
    calendar_file_file_size 1024
    calendar_file_updated_at Time.now
  end
end