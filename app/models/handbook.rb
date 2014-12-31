class Handbook < ActiveRecord::Base
  has_attached_file :file
  validates :title, presence: true
  validates_attachment :file, 
    :presence => true,
    :content_type => { :content_type => "application/pdf" }

  def self.most_current
    Handbook.where(current: true).order(updated_at: :desc).first
  end 
end
