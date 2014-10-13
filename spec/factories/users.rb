# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    fname "Shiba"
    lname "Inu"
    sequence :email do |n|
      "Shiba#{n}@inu.dog"
    end
    active true
    role "parent"
    password "woofwoof"
    confirmed_at Time.now
  end
end
