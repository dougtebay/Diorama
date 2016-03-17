class TweetsController < ApplicationController
  def search
    
    if params[:collection]
      @collection= Collection.find(params[:collection].to_i)
    end
    twitter_api = TwitterApi.new
    if twitter_api.validate_user(params[:user_name])
      if params[:twitter_id]
        @tweets = twitter_api.get_tweets(params[:user_name], options={max_id: params[:twitter_id].to_i - 1})
      else
        @tweets = twitter_api.get_tweets(params[:user_name], options={})
         # binding.pry
      end
      render :search
    else
      redirect_to root_path, notice: "That user is not valid."
    end
  end

  def create
    app= TwitterApi.new
    @tweets = params[:tweet].map do |twt_id|
      app.get_one_tweet(twt_id)
    end
    @tweets.each do |tweet| 
      tweet.save
      tweet.collections_tweets.create(collection_id: params[:collection][:id].to_i)    
    end
    redirect_to collection_path(params[:collection][:id].to_i), notice: "Selected Tweets have been added"
  end

  def destroy 
    @tweet=Tweet.find(params[:id])
    @collection=@tweet.collections.first
    @tweet.destroy
    redirect_to edit_collection_path(@collection), notice: "That tweet has been removed from this collection"
  end
end