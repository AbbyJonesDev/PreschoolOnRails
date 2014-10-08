class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.datetime :date,   null: false
      t.attachment :file, null: false
      t.timestamps
    end
  end
end
