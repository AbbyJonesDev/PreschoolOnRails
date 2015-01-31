class ClassAnnouncement < ActiveRecord::Base
  belongs_to :group
  belongs_to :announcement
end