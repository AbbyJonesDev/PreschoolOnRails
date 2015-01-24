class Announcements < ActiveRecord::Migration
  def change
    change_table :class_reminders do |t|
      t.remove :group_id
      t.string :klasses # Serialized array of associated classes
      t.boolean :all_classes, default: true
      t.date :expires_on, required: true
      t.boolean :email_sent, default: false
    end

    rename_table :class_reminders, :announcements
  end
end