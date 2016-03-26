# == Schema Information
#
# Table name: icons
#
#  id                          :integer          not null, primary key
#  image_file_name             :string
#  image_content_type          :string
#  image_file_size             :integer
#  image_updated_at            :datetime
#  {:null=>false}_file_name    :string
#  {:null=>false}_content_type :string
#  {:null=>false}_file_size    :integer
#  {:null=>false}_updated_at   :datetime
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

require 'rails_helper'

RSpec.describe Icon, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
