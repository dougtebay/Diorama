# == Schema Information
#
# Table name: tweets
#
#  id          :integer          not null, primary key
#  user_name   :string
#  user_handle :string
#  text        :string
#  date        :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Tweet < ActiveRecord::Base
  has_many :collections_tweets
  has_many :collections, through: :collections_tweets
  validates_presence_of :user_name, :user_handle, :text, :date

  def parse_tweet
    #takes the info for the tweet from the API itself, then saves it to db
  end

  
end
