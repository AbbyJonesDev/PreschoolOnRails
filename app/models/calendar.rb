# == Schema Information
#
# Table name: calendars
#
#  id                         :integer          not null, primary key
#  calendar_file_file_name    :string
#  calendar_file_content_type :string
#  calendar_file_file_size    :integer
#  calendar_file_updated_at   :datetime
#  created_at                 :datetime
#  updated_at                 :datetime
#  year                       :string
#

class Calendar < ActiveRecord::Base
  has_attached_file :calendar_file
  validates :year, 
    presence: true,
    format: { with: /\A20\d{2}-20\d{2}\z/, message: "must use format 20xx-20xx" }
  validates_attachment :calendar_file, 
    :presence => true,
    :content_type => { :content_type => "application/pdf" }
end
