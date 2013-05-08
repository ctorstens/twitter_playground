get '/' do
  erb :index
end

post '/' do
  redirect '/' + params[:twitter_user_name]
end

# get '/:twitterhandle' do
#   begin
#     Twitter.user(params[:username])
#     @user = User.find_or_create_by_twitter_user_name(params[:twitterhandle])
#     erb :user_tweets
#   rescue Exception => e 
#     p e
#     @error = true
#     erb :user_tweets
#   end

# end

post '/users_tweets' do 
  content_type :json
  @user = User.find_by_twitter_user_name(params[:twitter_user_name])
  if @user.tweets_stale?
    @user.fetch_tweets!
  end
  @tweets = @user.tweets.limit(10)
  (erb :_tweets, :layout => false).to_json
end

