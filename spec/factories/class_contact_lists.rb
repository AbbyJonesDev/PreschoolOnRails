# == Schema Information
#
# Table name: class_contact_lists
#
#  id                :integer          not null, primary key
#  group_id          :integer
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :class_contact_list do
  end
end
