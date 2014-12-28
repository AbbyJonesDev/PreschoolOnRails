class StudentsUsers < ActiveRecord::Migration
  def change
    create_table :students_users, id: false do |t|
      t.integer :student_id
      t.integer :user_id
    end
  end
end
