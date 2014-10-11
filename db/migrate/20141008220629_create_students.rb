class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :fname,               null: false
      t.string :lname,               default: ""
      t.boolean :currently_enrolled, default: true
      t.timestamps
    end
  end
end
