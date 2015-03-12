class Group < ActiveRecord::Base
  serialize :days, Array
  validates :name, presence: true
  validates :start_time, :end_time, presence: true
  has_one :class_contact_list, dependent: :destroy
  has_many :class_announcements
  has_many :announcements, :through => :class_announcements
  
  has_and_belongs_to_many   :students,  
                            :join_table =>  :enrolled_students
  
  
  has_and_belongs_to_many   :parents,  
                            :join_table => :class_parents,
                            :class_name => "User"

  after_create :create_contact_list
  after_create :register_admins

  def self.names_and_ids
    # Build hash of names and ids
    nai = {}
    self.all.each do |group|
      nai[group.name] = group.id
    end
    return nai
  end

  private

  def create_contact_list
    self.create_class_contact_list
  end

  def register_admins
    User.register_admins(self)
  end
 
end
