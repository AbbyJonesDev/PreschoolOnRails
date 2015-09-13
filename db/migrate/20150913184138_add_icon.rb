class AddIcon < ActiveRecord::Migration
  def up
    add_attachment :announcements, :icon
  end

  def down
    remove_attachment :announcements, :icon
  end
end
