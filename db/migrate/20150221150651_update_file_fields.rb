class UpdateFileFields < ActiveRecord::Migration
  def change
    change_table :calendars do |t|
      t.remove :current, :title
      t.string :year
    end
    change_table :handbooks do |t|
      t.remove :current, :title
      t.string :year
    end
    change_table :registration_forms do |t|
      t.remove :current, :title
      t.string :year
    end
    change_table :class_contact_lists do |t|
      t.remove :title
    end
  end
end
