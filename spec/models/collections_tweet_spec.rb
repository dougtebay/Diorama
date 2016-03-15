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

require 'rails_helper'

RSpec.describe CollectionsTweet, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
