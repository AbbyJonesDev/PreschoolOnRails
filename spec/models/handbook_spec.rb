# == Schema Information
#
# Table name: handbooks
#
#  id                :integer          not null, primary key
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime
#  updated_at        :datetime
#  year              :string
#

require 'rails_helper'

RSpec.describe Handbook, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
