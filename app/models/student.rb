class Student < ActiveRecord::Base
  has_and_belongs_to_many :groups, join_table: :enrolled_students

  def name
    self.lname ? "#{fname} #{lname}" : "fname"
  end
end
