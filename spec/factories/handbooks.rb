# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :handbook do
    title "Handbook"
    current false
    file_file_name 'handbook.pdf'
    file_content_type 'application/pdf'
    file_file_size 1024
    file_updated_at Time.now
  end
end