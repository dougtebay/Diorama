# create_table "users", force: :cascade do |t|
#     t.string   "twitter_profile"
#     t.string   "email_add"
#     t.string   "password"
#     t.datetime "created_at",      null: false
#     t.datetime "updated_at",      null: false

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
end