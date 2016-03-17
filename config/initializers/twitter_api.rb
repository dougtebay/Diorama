class TwitterApi
 attr_accessor :client

 def initialize
   keys = YAML.load_file('./config/secrets.yml')
   @client = Twitter::REST::Client.new do |config|
     config.consumer_key        = keys['CONSUMER_KEY']
     config.consumer_secret     = keys['CONSUMER_SECRET']
     config.access_token        = keys['ACCESS_TOKEN']
     config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
   end
 end

  def get_tweets(user_name, options)
    tweets = @client.user_timeline(user_name, options)
    tweets.map {|tweet| self.parse_tweet(tweet) }
  end

  def parse_tweet(tweet)
    twitter_id = tweet.id.to_s
    date = tweet.created_at.to_datetime
    text = tweet.text
    user_name = tweet.user.name
    user_handle = tweet.user.screen_name
    tweet = Tweet.new(date: date, text: text, user_name: user_name, user_handle: user_handle, twitter_id: twitter_id)
  end

  def get_one_tweet(id)
    tweet = @client.status(id)
    parse_tweet(tweet)
  end

  def validate_user(screen_name)
    @client.user?(screen_name)
  end
  
end