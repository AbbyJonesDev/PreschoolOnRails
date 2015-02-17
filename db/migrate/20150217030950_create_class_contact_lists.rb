class CreateClassContactLists < ActiveRecord::Migration
  def change
    create_table :class_contact_lists do |t|
      t.belongs_to :group, index: true
      t.string :title
      t.attachment :file
      t.timestamps
    end
  end
end

