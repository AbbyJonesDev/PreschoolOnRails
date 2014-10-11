class Newsletter < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.datetime :date
      t.attachment :file
    end
  end
end
