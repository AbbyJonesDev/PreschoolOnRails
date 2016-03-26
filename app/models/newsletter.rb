# == Schema Information
#
# Table name: newsletters
#
#  id                :integer          not null, primary key
#  date              :datetime
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  email_sent        :boolean          default(FALSE)
#

class Newsletter < ActiveRecord::Base
  has_attached_file :file
  validates_attachment :file, :presence => true,
                              :content_type => { :content_type => "application/pdf"}

  validates :date, :presence => true
  
  def self.newest
    self.order(date: :desc).first
  end

end
