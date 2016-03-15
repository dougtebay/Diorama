require 'rails_helper'

describe User do
  before(:each) do
    @user = User.create(twitter_profile: "Bobbo", email_add: "bobbo@gmail.com", password: "password")
  end

  it 'can be created' do
    expect(@user.class).to eq(User)
  end

  it 'is invalid without attributes' do
    expect(@user).to be_valid
  end

  it 'can create a collection' do
    @collection = @user.collections.build(name: 'Good Tweets', description: 'Tweets I like!', private?: true)
    expect(@collection.user).to eq(@user)
  end
end