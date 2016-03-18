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

require 'rails_helper'

describe Tweet do
  before(:each) do
    @tweet= Tweet.create(user_name:"bobbo", user_handle: "@bobbo", text:"Blocked, blocked, you're all blocked, none of you are free from sin", date: Datetime.new(2013, 02, 04))
  end

  it 'can be created' do
    expect(@tweet.class).to eq(Tweet)
  end

  it 'is invalid without attributes' do
    expect(@tweet).to be_valid
  end


  describe "parse_tweet" do
    it "can take a tweet's information and persist it all to the database" do
      persisted_tweet= @tweet.parse_tweet
      expect()

  
end
