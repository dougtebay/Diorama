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
  has_secure_password
  has_many :collections
  has_many :tweets, through: :collections
  validates_presence_of :user_name, :email

  def average_collection_length
    total_tweets = 0.00
    self.collections.each do |collection|
      total_tweets += collection.tweets.count 
    end
    total_tweets/self.collections.count
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

  def find_most_common_saved
    all_usernames.group_by do |username|
      username
    end.values.max_by(&:size).first
  end





end
