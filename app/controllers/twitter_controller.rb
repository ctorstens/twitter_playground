
get '/twitter/sign_in' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  redirect request_token.authorize_url
end

get '/twitter/auth' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  @twitter_access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # our request token is only valid until we use it to get an access token, so let's delete it from our session
  session.delete(:request_token)

  # at this point in the code is where you'll need to create your user account and store the access token
  p @twitter_access_token.inspect
  current_user.update_attributes(:twitter_user_name => @twitter_access_token.params[:screen_name], :twitter_oauth_token => @twitter_access_token.params[:oauth_token], :twitter_oauth_secret => @twitter_access_token.params[:oauth_token_secret])
  # User.create(:twitter_user_name => @twitter_access_token.params[:screen_name], :twitter_oauth_token => @twitter_access_token.params[:oauth_token], :twitter_oauth_secret => @twitter_access_token.params[:oauth_token_secret])
  @twitter_access_token
  # erb :index
  redirect '/twitter/user/' + current_user.twitter_user_name
end



get '/twitter/user/:twitterhandle' do
  begin
    @client = Twitter::Client.new(
      :consumer_key => ENV['TWITTER_KEY'],
      :consumer_secret => ENV['TWITTER_SECRET'],
      :oauth_token => current_user.twitter_oauth_token,
      :oauth_token_secret => current_user.twitter_oauth_secret
      )
    puts "Fetch Tweets"
    p @client
    @client.user(params[:twitterhandle])
      # @client.update(params[:tweet])

    # Twitter.user(params[:username])
    @user = User.find_or_create_by_twitter_user_name(params[:twitterhandle])
    @client.user_timeline(params[:twitterhandle])
    erb :user_tweets
  rescue Exception => e 
    @error = true
    erb :user_tweets
  end

end

post '/users_tweets' do 
  content_type :json
  @user = User.find_by_twitter_user_name(params[:twitter_user_name])
  if @user.tweets_stale?
    @user.fetch_tweets!
  end
  @tweets = @user.tweets.limit(14)
  (erb :_tweets, :layout => false).to_json
end

