# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  twitter_profile :string
#  email_add       :string
#  password        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
