# == Schema Information
#
# Table name: drivers
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  bus_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
