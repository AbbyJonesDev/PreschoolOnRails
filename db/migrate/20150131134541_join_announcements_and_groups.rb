class JoinAnnouncementsAndGroups < ActiveRecord::Migration
  def change
    create_table :class_announcements do |t|
      t.belongs_to :group, index: true
      t.belongs_to :announcement, index: true
      t.timestamps null: false
    end
  end
end
