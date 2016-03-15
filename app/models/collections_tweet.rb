# == Schema Information
#
# Table name: collections_tweets
#
#  id            :integer          not null, primary key
#  collection_id :integer
#  tweet_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CollectionsTweet < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :collection
end
