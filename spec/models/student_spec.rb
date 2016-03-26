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

require 'rails_helper'

RSpec.describe Student, :type => :model do

end
