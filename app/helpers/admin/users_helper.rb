module Admin::UsersHelper
  def full_name(person)
    if person.lname == ""
      return person.fname
    else
      return person.fname + " " + person.lname
    end
  end

  def klass_names(person)
    if person.groups == []
      return "Not assigned to a class"
    else
      klass_names = []
      person.groups.each do |klass|
        klass_names << klass.name
      end
      return klass_names.join(", ")
    end
  end
end
