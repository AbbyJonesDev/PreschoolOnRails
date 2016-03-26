# == Schema Information
#
# Table name: peek_and_vocabs
#
#  id                 :integer          not null, primary key
#  date               :date
#  peek_file_name     :string
#  peek_content_type  :string
#  peek_file_size     :integer
#  peek_updated_at    :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  email_sent         :boolean          default(FALSE)
#  vocab_file_name    :string
#  vocab_content_type :string
#  vocab_file_size    :integer
#  vocab_updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :peek_and_vocab do
    datetime "2015-01-20"
    attachment ""
  end
end
