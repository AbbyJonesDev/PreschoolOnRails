class CreateHandbooks < ActiveRecord::Migration
  def change
    create_table :handbooks do |t|
      t.string :title
      t.attachment :file
      t.boolean :current

      t.timestamps
    end
  end
end
