class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :groups,
                          :join_table  => :class_parents

  has_and_belongs_to_many :students
  has_many :announcements, :through => :groups

  
  # Causing an infinite loop
  # Investigate more later...
  # scope :parents, -> { where(role: 'parent') } 


  def update_klasses(ids)
    # This whole method is terrible and should be
    # refactored with a vengeance.
    # But for now...it works.
    begin
      # Check existing groups
      self.groups.each do |group|
        # Remove duplicate ids from params
        if ids.include?(group.id)
          ids.delete(group.id)
        # Remove deprecated ids from user
        else
          self.groups.delete(group.id)
        end
      end
      # Add non-duplicate groups from params
      ids.each { |id| self.groups << Group.find(id) }
    rescue
      # Blows up on ids.each if there are no ids
      self.groups = []
    end
  end

  def klass_ids
    ids = []
    self.groups.each { |group| ids << group.id }
    return ids
  end

end
