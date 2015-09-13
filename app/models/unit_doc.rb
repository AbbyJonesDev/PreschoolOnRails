class UnitDoc < ActiveRecord::Base
  has_attached_file :doc
  validates :year, 
    presence: true,
    format: { with: /\A20\d{2}-20\d{2}\z/, message: "must use format 20xx-20xx" }
  validates_attachment :doc, 
    :presence => true,
    :content_type => { :content_type => "application/pdf" }
end