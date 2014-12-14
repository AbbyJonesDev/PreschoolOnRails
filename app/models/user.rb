class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :groups,
                          :join_table  => :class_parents

  # Causing an infinite loop
  # Investigate more later...
  # scope :parents, -> { where(role: 'parent') } 

end
