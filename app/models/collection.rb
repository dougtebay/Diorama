# == Schema Information
#
# Table name: collections
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  privacy     :boolean          default(TRUE)
#

class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :collections_tweets
  has_many :tweets, through: :collections_tweets
  validates_presence_of :name

  def activate
    privacy ? self.privacy= false : self.privacy= true
  end

  def profiles_by_popularity
    ordered_tweets=self.tweets.group_by {|tweet| tweet.user_name}
    ordered_tweets.sort_by {|username, tweets| tweets.length}
  end

  def top_three_profiles
    array=self.profiles_by_popularity.map do |profiles|
      profiles[0]
    end
    array.last(3)
  end

  def count_by_username(username)
    self.tweets.where(user_name: username).count 
  end

  def sum_of_three_most_popular
    sum=0
    self.top_three_profiles.each do |name|
      sum += self.count_by_username(name)
      
    end
    sum
  end

  def sum_of_other_tweets
    self.tweets.count-sum_of_three_most_popular
  end

  def chart_data_hash
    hash=Hash.new
    self.top_three_profiles.each do |profile|
      hash[profile] = self.count_by_username(profile)
    end
    hash["Other"] = sum_of_other_tweets
    hash
  end


end
