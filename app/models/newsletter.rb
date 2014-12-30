class Newsletter < ActiveRecord::Base
  has_attached_file :file
  validates_attachment :file, :presence => true,
                              :content_type => { :content_type => "application/pdf"}

  validates :date, :presence => true
  
  def self.newest
    self.order(date: :desc).first
  end

end