# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    sequence :name do |n|
      "Class #{n}"
    end
    days ["Monday", "Wednesday"]
    start_time Time.now
    end_time Time.now + 2.hours
  end
end
