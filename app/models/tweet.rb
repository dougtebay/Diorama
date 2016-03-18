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
#  twitter_id  :string
#

class Tweet < ActiveRecord::Base
  has_many :collections_tweets
  has_many :collections, through: :collections_tweets
  validates_presence_of :user_name, :user_handle, :text, :date

  def self.all_usernames
    self.all.map do |tweet|
      tweet.user_name
    end
  end

  def self.most_common_saved_user
    self.all_usernames.group_by do |username|
      username 
    end.values.max_by(&:size).first
  end

  
end

