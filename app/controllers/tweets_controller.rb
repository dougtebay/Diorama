class TweetsController < ApplicationController
  def search
    twitter_api = TwitterApi.new
    @tweets = twitter_api.get_tweets(params[:user_name])
    render :search
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
    redirect_to collection_path(params[:collection][:id].to_i), notice: "YAAAAAY! Tweets are saved, this is a placeholder"
  end

  def destroy 
    @tweet=Tweet.find(params[:id])
    @collection=@tweet.collections.first
    @tweet.destroy
    redirect_to edit_collection_path(@collection), notice: "That tweet has been removed from this collection"
  end
end