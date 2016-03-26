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

require 'rails_helper'

RSpec.describe PeekAndVocab, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
