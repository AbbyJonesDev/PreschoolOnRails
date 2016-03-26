# == Schema Information
#
# Table name: newsletters
#
#  id                :integer          not null, primary key
#  date              :datetime
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  email_sent        :boolean          default(FALSE)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :newsletter do
    date Time.now
    file_file_name 'test.pdf'
    file_content_type 'application/pdf'
    file_file_size 1024
    file_updated_at Time.now
  end
end
