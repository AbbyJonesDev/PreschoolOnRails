class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :days
      t.time :start_time
      t.time :end_time
      t.timestamps
    end
  end
end
