# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  days       :string
#  start_time :time
#  end_time   :time
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    sequence :name do |n|
      "Class #{n}"
    end
    days ["Monday", "Wednesday"]
    start_time Time.now
    end_time Time.now + 2.hours

    after(:create) {|group| group.students = [create(:student)]}
  end
end
