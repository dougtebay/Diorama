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

require 'rails_helper'

describe Collection do
  before(:each) do
    @collection = Collection.create(name: 'Good Tweets', description: 'Tweets I like!', user_id: 1)
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

  it 'is private when first created' do
    expect(@collection.privacy).to eq(true)
  end

  describe 'activate' do
    it 'swaps the privacy setting of a collection' do 
      expect(@collection.activate).to eq(false)
    end
  end

  describe 'profiles_by_popularity' do
    it 'displays the profiles in order of how many of their tweets appear in the collection' do
      expect(@collection.)
    end
  end

end
