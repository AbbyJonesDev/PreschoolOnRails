class PeekAndVocab < ActiveRecord::Base
  has_attached_file :peek
  has_attached_file :vocab
  validates_attachment :peek, :presence => true,
                              :content_type => { :content_type => "application/pdf"}
  validates_attachment :vocab, :presence => true,
                              :content_type => { :content_type => "application/pdf"}

  validates :date, :presence => true
end