class Group < ActiveRecord::Base
  serialize :days, Array
  
  has_and_belongs_to_many   :students,  
                            :join_table =>  :enrolled_students
  
  
  has_and_belongs_to_many   :parents,  
                            :join_table => :class_parents,
                            :class_name => "User"

  def self.names_and_ids
    # Build hash of names and ids
    nai = {}
    self.all.each do |group|
      nai[group.name] = group.id
    end
    return nai
  end 
end
