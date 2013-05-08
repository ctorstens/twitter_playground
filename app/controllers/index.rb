get '/' do
  erb :index
end

post '/' do
  redirect '/twitter/user/' + params[:twitter_user_name]
end

