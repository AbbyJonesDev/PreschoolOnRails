# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    sequence :fname do |n|
      "Kelly #{n}"
    end
    sequence :lname do |n|
      "Smith#{n}"
    end
    # association :parent, factory: :user, strategy: :build
  end
end
