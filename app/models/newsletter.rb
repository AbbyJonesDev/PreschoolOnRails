class Newsletter < ActiveRecord::Base
  has_attached_file :file
  validates_attachment :file, :presence => true,
                              :content_type => { :content_type => "application/pdf"}

  validates :date, :presence => true

  def self.newest
    self.order(date: :desc).first
  end

  def self.for_year (startYear)
    @start = Date.new(startYear, 8, 1)   # August of the start year
    self.where(date: @start..@start.next_year).order(date: :desc)
  end

  def self.for_current_school_year
    @current = Time.now
    if @current.month > 7
      return Newsletter.for_year @current.year
    end
    return Newsletter.for_year @current.year - 1
  end

end
