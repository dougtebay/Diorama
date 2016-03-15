require 'rails_helper'

describe Collection do
  before(:each) do
    @collection = Collection.create(name: 'Good Tweets', description: 'Tweets I like!', user_id: 1, private?: true)
  end

  it 'can be created' do
    expect(@collection.class).to eq(Collection)
  end

  it 'is invalid without attributes' do
    expect(@collection).to be_valid
  end

  it 'belongs to a user' do
    expect(@collection.user.class).to eq(User)
  end

end