class ClassContactList < ActiveRecord::Base
  belongs_to :group
  has_attached_file :file
  validates :title, presence: true
  validates_attachment :file, 
    :presence => true,
    :content_type => { :content_type => "application/pdf" }
end