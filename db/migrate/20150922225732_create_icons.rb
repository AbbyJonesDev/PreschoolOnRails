class CreateIcons < ActiveRecord::Migration
  def change
    create_table :icons do |t|
      t.attachment :image, null: false
      t.timestamps null: false
    end
    change_table :announcements do |t|
      # Add column for association
      t.belongs_to :icon, index: true
      # Remove columns from Paperclip attachments
      t.remove  :icon_file_name, 
                :icon_content_type, 
                :icon_file_size,
                :icon_updated_at
    end
  end
end
