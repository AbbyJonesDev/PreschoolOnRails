# == Schema Information
#
# Table name: students
#
#  id                 :integer          not null, primary key
#  fname              :string           not null
#  lname              :string           default("")
#  currently_enrolled :boolean          default(TRUE)
#  created_at         :datetime
#  updated_at         :datetime
#

class Student < ActiveRecord::Base
  has_and_belongs_to_many :groups, join_table: :enrolled_students

  def name
    self.lname ? "#{fname} #{lname}" : "fname"
  end
end
