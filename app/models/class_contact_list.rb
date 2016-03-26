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

class ClassContactList < ActiveRecord::Base
  belongs_to :group
  has_attached_file :file
  validates_attachment :file, 
    :content_type => { :content_type => "application/pdf" }
end
