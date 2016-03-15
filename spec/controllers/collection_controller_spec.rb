require 'rails_helper'

describe CollectionsController do 

  before(:each) do 
    @collection=Collection.create(name: 'Good Tweets', description: 'Tweets I like!', user_id: 1, private?: true)
    @user = User.create(twitter_profile: 'jeffkatz', email_add: 'jeff@flatironschool.com', password: 'learnlovecode')
  end

  describe "POST create" do
    it "creates a new collection" do
      expect{
        post :create, { :collection => { :name => "Good Tweets", :description => "Tweets I Like", :user_id => 1, :private? => true } }
      }.to change(Collection,:count).by(1)
    end

    it "redirects to the new collection" do
        post :create, { :collection => { :name => "Good Tweets", :description => "Tweets I Like", :user_id => 1, :private? => true } }
        expect(response).to redirect_to Collection.last
    end
  end
  

end 






# describe CouponsController do

  # describe "POST create" do
  #   context "with valid attributes" do
  #     it "creates a new coupon" do
  #       expect{
  #         post :create, { :coupon => { :coupon_code => "ASD123", :store => "Dean and Deluca" } }
  #       }.to change(Coupon,:count).by(1)
  #     end
      


# end