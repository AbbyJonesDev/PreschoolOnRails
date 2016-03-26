# == Schema Information
#
# Table name: registration_forms
#
#  id                :integer          not null, primary key
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime
#  updated_at        :datetime
#  year              :string
#

class RegistrationForm < ActiveRecord::Base
  has_attached_file :file
  validates :year, 
    presence: true,
    format: { with: /\A20\d{2}-20\d{2}\z/, message: "must use format 20xx-20xx" }
  validates_attachment :file, 
    :presence => true,
    :content_type => { :content_type => "application/pdf" }
end
