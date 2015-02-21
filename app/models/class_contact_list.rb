class ClassContactList < ActiveRecord::Base
  belongs_to :group
  has_attached_file :file
  validates_attachment :file, 
    :content_type => { :content_type => "application/pdf" }
end