# == Schema Information
#
# Table name: unit_docs
#
#  id               :integer          not null, primary key
#  year             :string
#  doc_file_name    :string
#  doc_content_type :string
#  doc_file_size    :integer
#  doc_updated_at   :datetime
#  created_at       :datetime
#  updated_at       :datetime
#

class UnitDoc < ActiveRecord::Base
  has_attached_file :doc
  validates :year, 
    presence: true,
    format: { with: /\A20\d{2}-20\d{2}\z/, message: "must use format 20xx-20xx" }
  validates_attachment :doc, 
    :presence => true,
    :content_type => { :content_type => "application/pdf" }
end
