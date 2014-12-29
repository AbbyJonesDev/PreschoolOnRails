class Calendar < ActiveRecord::Base
  has_attached_file :calendar_file
  validates :title, presence: true
  validates_attachment :calendar_file, 
    :presence => true,
    :content_type => { :content_type => "application/pdf" }

  def self.most_current
    Calendar.where(current: true).order(updated_at: :desc).first
  end 
end

