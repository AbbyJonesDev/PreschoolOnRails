# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  fname                  :string           default(""), not null
#  lname                  :string           default(""), not null
#  role                   :string           default("parent"), not null
#  active                 :boolean          default(TRUE)
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime
#  updated_at             :datetime
#

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
