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

class PeekAndVocab < ActiveRecord::Base
  has_attached_file :peek
  has_attached_file :vocab
  validates_attachment :peek, :presence => true,
                              :content_type => { :content_type => "application/pdf"}
  validates_attachment :vocab, :presence => true,
                              :content_type => { :content_type => "application/pdf"}

  validates :date, :presence => true
end
