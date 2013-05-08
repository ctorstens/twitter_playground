class User < ActiveRecord::Base
  has_many :tweets
  
  attr_reader :entered_password

  include BCrypt


  MAX_REFRESH_INTERVAL = 24 * 60 * 60 # seconds in a day
  NUM_OF_SAMPLE_TWEETS = 10 # num of tweets to look at to compute average


  def average_tweet_interval
    most_recent_tweets = Twitter.user_timeline(self.twitter_user_name).take(NUM_OF_SAMPLE_TWEETS)
    most_recent_times = most_recent_tweets.map {|tweet| tweet.created_at}
    arr_diff = most_recent_times.reverse.each_cons(2).map {|a,b| b - a }
    arr_diff.inject(0) {|sum, time| sum + time}.to_f / NUM_OF_SAMPLE_TWEETS
  end

  def time_since_last_tweet_check
    Time.now.getutc - self.most_recent_refresh
  end

  def stale_threshold
    if average_tweet_interval > MAX_REFRESH_INTERVAL
      MAX_REFRESH_INTERVAL
    else
      average_tweet_interval
    end
  end

  def tweets_stale?
    if time_since_last_tweet_check > stale_threshold
      true
    else
      false
    end
  end

  def fetch_tweets!
    @client = Twitter::Client.new(
        :oauth_token => self.twitter_oauth_token,
        :oauth_token_secret => self.twitter_oauth_secret
        )
    puts "Fetch Tweets in user"
    p @client

    fetched_tweets = @client.user_timeline(self.twitter_user_name).map {|tweet| tweet.text}
    puts "Fetched Tweets"
    p fetched_tweets
    fetched_tweets.each do |t| 
      self.tweets << Tweet.create(:text => t)
    end
    self.most_recent_refresh = Time.now.getutc # reset refresh clock
    self.save
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_hash = @password
  end

  def self.authenticate(user_name, password)
    user = User.find_by_user_name(user_name)
    return user if user && (user.password == password)
    nil # either invalid user_name or wrong password
  end
end
