# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  days       :string
#  start_time :time
#  end_time   :time
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Group, :type => :model do

  it { should have_and_belong_to_many(:students) }
  it { should have_and_belong_to_many(:parents) }

end
