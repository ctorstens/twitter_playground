
get '/twitter/sign_in' do
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  redirect request_token.authorize_url
end

# get '/twitter/sign_out' do
#   session.clear
#   redirect '/'
# end

get '/twitter/auth' do
  p "got here!"
  # the `request_token` method is defined in `app/helpers/oauth.rb`
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  # our request token is only valid until we use it to get an access token, so let's delete it from our session
  session.delete(:request_token)

  # at this point in the code is where you'll need to create your user account and store the access token
  User.create(:twitter_user_name => @access_token.params[:screen_name], :twitter_oauth_token => @access_token.params[:oauth_token], :twitter_oauth_secret => @access_token.params[:oauth_token_secret])
  @access_token

  erb :index
  
end
