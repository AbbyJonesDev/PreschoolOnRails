require 'rails_helper'

RSpec.describe Group, :type => :model do

  it { should have_and_belong_to_many(:students) }
  it { should have_and_belong_to_many(:parents) }

end
