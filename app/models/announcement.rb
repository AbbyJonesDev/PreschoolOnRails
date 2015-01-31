class ExpirationDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value && value < Time.now - 1.day
      record.errors[attribute] << (options[:message] || "date has already passed")
    end
  end
end

class Announcement < ActiveRecord::Base
  serialize :klasses
  validates :expires_on, :expiration_date => true
  validates :name, :message, :expires_on, presence: true
  validates :klasses, presence: true, if: :not_all_classes
  has_many :class_announcements
  has_many :groups, :through => :class_announcements
  scope :current, -> { where "expires_on > ?", Time.now }
  scope :expired, -> { where "expires_on <= ?", Time.now}

  # Used by custom validator
  def not_all_classes
    self.all_classes? == false
  end

  # Used in the view to display class names
  def klass_names
    if self.klasses == [] || self.klasses == nil
      return ''
    end
    names = []
    self.klasses.each do |k|
      names << Group.find(k).name
    end
    return names.join(', ')
  end

  # Used to get announcements for a user
  def self.for_user(user)
    announcements = []
    announcements << Announcement.current.where(all_classes: true)
    return announcements
  end
end