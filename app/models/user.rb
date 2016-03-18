# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_name  :string
#  email      :string
#

class User < ActiveRecord::Base
  has_many :authorizations
  has_many :collections
  has_many :tweets, through: :collections
  validates_presence_of :user_name

  def average_collection_length
    self.tweets.count/self.collections.count
  end

  def tweets_saved_by_username(username)
    self.tweets.where(user_name: username)
  end

  def tweets_saved_by_handle(handle)
    self.tweets.where(handle: handle)
  end

  def all_usernames
    self.tweets.map do |tweet|
      tweet.user_name
    end
  end 

  def self.all_tweets_saved
    self.all.map do |user|
      user.tweets 
    end
  end


  def most_common_saved
    all_usernames.group_by do |username|
      username
    end.values.max_by(&:size).first
  end


  def profiles_by_popularity
    ordered_tweets=self.tweets.group_by {|tweet| tweet.user_name}
    ordered_tweets.sort_by {|username, tweets| tweets.length}
  end

  def top_five_profiles
    array=self.profiles_by_popularity.map do |profiles|
      profiles[0]
    end
    array[0..4]
  end

  def last_tweet_saved
    self.tweets.last 
  end



end
