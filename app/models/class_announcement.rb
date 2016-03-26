# == Schema Information
#
# Table name: class_announcements
#
#  id              :integer          not null, primary key
#  group_id        :integer
#  announcement_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class ClassAnnouncement < ActiveRecord::Base
  belongs_to :group
  belongs_to :announcement
end
