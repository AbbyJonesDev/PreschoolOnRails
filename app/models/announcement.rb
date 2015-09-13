class ExpirationDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value && value < Time.now - 1.day
      record.errors[attribute] << (options[:message] || "date has already passed")
    end
  end
end

class Announcement < ActiveRecord::Base
  serialize :klasses # Remove column after switching existing announcements 
  validates :expires_on, :expiration_date => true
  validates :name, :message, :expires_on, presence: true
  validates :group_ids, length: { minimum: 1,
    too_short: "must include at least one class" }, if: :not_all_classes
  has_many :class_announcements
  has_many :groups, :through => :class_announcements
  has_attached_file :icon, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/logo-icon.jpg"
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/
  scope :current, -> { where "expires_on > ?", Time.now }
  scope :expired, -> { where "expires_on <= ?", Time.now}

  # Used by custom validator
  def not_all_classes
    self.all_classes? == false
  end

  # Used in the view to display class names
  def klass_names
    if self.group_ids == [] || self.group_ids == nil
      return ''
    end
    names = []
    self.group_ids.each do |id|
      names << Group.find(id).name
    end
    return names.join(', ')
  end

  # Used to get announcements for a user
  def self.for_user(user)
    announcements = []
    announcements << Announcement.current.where(all_classes: true).to_a
    announcements << user.announcements.current.to_a
    # Two ways of doing the same thing...
    # Save SQL version (commented out now) for 
    # possible use later in combining queries...
    # announcements << Announcement.current.joins(:groups).where('groups.id' => user.groups)
    return announcements.flatten.uniq
  end
end