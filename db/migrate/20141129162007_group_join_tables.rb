class GroupJoinTables < ActiveRecord::Migration
  def change
    # Join table for students in class
    create_table :enrolled_students, id: false do |t|
      t.integer :student_id
      t.integer :group_id
    end
    # Join table for parents and class
    create_table :class_parents, id: false do |t|
      t.integer :parent_id
      t.integer :group_id
    end
  end
end
