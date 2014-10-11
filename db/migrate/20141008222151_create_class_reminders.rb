class CreateClassReminders < ActiveRecord::Migration
  def change
    create_table :class_reminders do |t|
      t.string :name,       null: false
      t.text :message,      null: false
      t.integer :group_id,  null: false
      t.timestamps
    end
  end
end
