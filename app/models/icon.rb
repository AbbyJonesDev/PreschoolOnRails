# == Schema Information
#
# Table name: icons
#
#  id                          :integer          not null, primary key
#  image_file_name             :string
#  image_content_type          :string
#  image_file_size             :integer
#  image_updated_at            :datetime
#  {:null=>false}_file_name    :string
#  {:null=>false}_content_type :string
#  {:null=>false}_file_size    :integer
#  {:null=>false}_updated_at   :datetime
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class Icon < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/logo-icon.jpg"
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
