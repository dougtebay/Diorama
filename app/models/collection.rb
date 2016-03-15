# == Schema Information
#
# Table name: collections
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  description :string
#  private?    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :collections_tweets
  has_many :tweets, through: :collections_tweets
  validates_presence_of :name

end
