class UnitDoc < ActiveRecord::Migration
  def change
    create_table :unit_docs do |t|
      t.string :year
      t.attachment :doc

      t.timestamps
    end
  end
end