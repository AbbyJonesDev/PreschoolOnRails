class Newsletter < ActiveRecord::Base
  has_attached_file :file
  validates_attachment :file, :presence => true,
                              :content_type => { :content_type => "application/pdf"}


  def self.current
    self.order(date: :desc).first
  end

end