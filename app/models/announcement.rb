class Announcement < ActiveRecord::Base
  serialize :klasses

  def klass_names
    if self.klasses == [] || self.klasses == nil
      return ''
    end
    names = []
    self.klasses.each do |k|
      names << Group.find(k).name
    end
    return names.join(', ')
  end

end