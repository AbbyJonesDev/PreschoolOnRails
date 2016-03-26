# == Schema Information
#
# Table name: class_contact_lists
#
#  id                :integer          not null, primary key
#  group_id          :integer
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime
#  updated_at        :datetime
#

require 'rails_helper'

RSpec.describe ClassContactList, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
