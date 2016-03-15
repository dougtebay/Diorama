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

class User < ActiveRecord::Base
  has_many :collections
  has_many :tweets, through: :collections
  validates_presence_of :twitter_profile, :email_add, :password
end
