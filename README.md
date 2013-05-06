# My Skeleton App
===========

## Directions

1. In github, make [a new repo](https://github.com/new)
1. ```git clone https://github.com/ctorstens/mSinSkel.git```
1. Move into the cloned directory
1. ```$ git remote set-url origin <new_repo_url>```

## Includes
- Sinatra Skeleton
- User migration
  - first_name
  - last_name
  - user_name
  - email
  - password_hash
  - timestamps
- User model
- User Authorization
  - bcrypt

## To Do
- switch session to user tokens
- further CSS refinement
- email verification through confirmation email ([ActionMailer](http://guides.rubyonrails.org/action_mailer_basics.html))
  - [Authlogic Password Reset Tutorial](https://github.com/rejeep/authlogic-password-reset-tutorial)
  - [Authlogic Activation Tutorial](https://github.com/matthooks/authlogic-activation-tutorial)
  - [StackOverflow: Email confirmation in Rails without using any existing authentication gems/plugins](http://stackoverflow.com/questions/3984977/email-confirmation-in-rails-without-using-any-existing-authentication-gems-plugi)

  ## User Info (Twitter.user)

  ``` ruby
    <Twitter::User:0x007ffd3b98bc88 
      @attrs={
       :id=>138671360,
       :id_str=>"138671360",
       :name=>"Angie Bui",
       :screen_name=>"angie_bui",
       :location=>"SF, CA",
       :description=>"Product Manager, Programmer in-training. Loves traveling, musicals and food.",
       :url=>"http://t.co/TSNpDz8ew5",
       :entities=>{:url=>{:urls=>[{:url=>"http://t.co/TSNpDz8ew5",
       :expanded_url=>"http://angiescode.tumblr.com",
       :display_url=>"angiescode.tumblr.com",
       :indices=>[0, 22]}]},
       :description=>{:urls=>[]}},
       :protected=>false,
       :followers_count=>340,
       :friends_count=>176,
       :listed_count=>20,
       :created_at=>"Fri Apr 30 06:44:09 +0000 2010",
       :favourites_count=>342,
       :utc_offset=>-28800,
       :time_zone=>"Pacific Time (US & Canada)",
       :geo_enabled=>true,
       :verified=>false,
       :statuses_count=>2902,
       :lang=>"en",
       :status=>{:created_at=>"Sun May 05 19:22:45 +0000 2013",
       :id=>331126839047229440,
       :id_str=>"331126839047229440",
       :text=>"Super delayed but a tweet is necessary. Season 3 of #BreakingBad? Epic.",
       :source=>"<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>",
       :truncated=>false,
       :in_reply_to_status_id=>nil,
       :in_reply_to_status_id_str=>nil,
       :in_reply_to_user_id=>nil,
       :in_reply_to_user_id_str=>nil,
       :in_reply_to_screen_name=>nil,
       :geo=>nil,
       :coordinates=>nil,
       :place=>nil,
       :contributors=>nil,
       :retweet_count=>1,
       :favorite_count=>2,
       :entities=>{:hashtags=>[{:text=>"BreakingBad",
       :indices=>[52, 64]}],
       :symbols=>[],
       :urls=>[],
       :user_mentions=>[]},
       :favorited=>false,
       :retweeted=>false,
       :lang=>"en"},
       :contributors_enabled=>false,
       :is_translator=>false,
       :profile_background_color=>"F5F5F5",
       :profile_background_image_url=>"http://a0.twimg.com/profile_background_images/320777862/VanGogh.jpg",
       :profile_background_image_url_https=>"https://si0.twimg.com/profile_background_images/320777862/VanGogh.jpg",
       :profile_background_tile=>false,
       :profile_image_url=>"http://a0.twimg.com/profile_images/3587471789/bce5a1a7c5139e8f37273ea78e00d34e_normal.jpeg",
       :profile_image_url_https=>"https://si0.twimg.com/profile_images/3587471789/bce5a1a7c5139e8f37273ea78e00d34e_normal.jpeg",
       :profile_banner_url=>"https://si0.twimg.com/profile_banners/138671360/1367168531",
       :profile_link_color=>"ED7C03",
       :profile_sidebar_border_color=>"EEEEEE",
       :profile_sidebar_fill_color=>"F6F6F6",
       :profile_text_color=>"333333",
       :profile_use_background_image=>false,
       :default_profile=>false,
       :default_profile_image=>false,
       :following=>false,
       :follow_request_sent=>false,
       :notifications=>false}>
  ```

  ## Tweet Info (Twitter.user_timeline)

  ``` ruby
  <Twitter::Tweet:0x007ffd3d0af1d0 
  @attrs={:created_at=>"Fri Apr 19 02:05:42 +0000 2013",
   :id=>325067653075042305,
   :id_str=>"325067653075042305",
   :text=>"\"Things I Wish I Knew Before Starting Instagram\" mikeyk @ Dev Bootcamp http://t.co/pZ3aCXEgBH",
   :source=>"<a href=\"http://instagram.com\" rel=\"nofollow\">Instagram</a>",
   :truncated=>false,
   :in_reply_to_status_id=>nil,
   :in_reply_to_status_id_str=>nil,
   :in_reply_to_user_id=>nil,
   :in_reply_to_user_id_str=>nil,
   :in_reply_to_screen_name=>nil,
   :user=>{:id=>138671360,
   :id_str=>"138671360",
   :name=>"Angie Bui",
   :screen_name=>"angie_bui",
   :location=>"SF, CA",
   :description=>"Product Manager, Programmer in-training. Loves traveling, musicals and food.",
   :url=>"http://t.co/TSNpDz8ew5",
   :entities=>{:url=>{:urls=>[{:url=>"http://t.co/TSNpDz8ew5",
   :expanded_url=>"http://angiescode.tumblr.com",
   :display_url=>"angiescode.tumblr.com",
   :indices=>[0, 22]}]},
   :description=>{:urls=>[]}},
   :protected=>false,
   :followers_count=>340,
   :friends_count=>176,
   :listed_count=>20,
   :created_at=>"Fri Apr 30 06:44:09 +0000 2010",
   :favourites_count=>342,
   :utc_offset=>-28800,
   :time_zone=>"Pacific Time (US & Canada)",
   :geo_enabled=>true,
   :verified=>false,
   :statuses_count=>2902,
   :lang=>"en",
   :contributors_enabled=>false,
   :is_translator=>false,
   :profile_background_color=>"F5F5F5",
   :profile_background_image_url=>"http://a0.twimg.com/profile_background_images/320777862/VanGogh.jpg",
   :profile_background_image_url_https=>"https://si0.twimg.com/profile_background_images/320777862/VanGogh.jpg",
   :profile_background_tile=>false,
   :profile_image_url=>"http://a0.twimg.com/profile_images/3587471789/bce5a1a7c5139e8f37273ea78e00d34e_normal.jpeg",
   :profile_image_url_https=>"https://si0.twimg.com/profile_images/3587471789/bce5a1a7c5139e8f37273ea78e00d34e_normal.jpeg",
   :profile_banner_url=>"https://si0.twimg.com/profile_banners/138671360/1367168531",
   :profile_link_color=>"ED7C03",
   :profile_sidebar_border_color=>"EEEEEE",
   :profile_sidebar_fill_color=>"F6F6F6",
   :profile_text_color=>"333333",
   :profile_use_background_image=>false,
   :default_profile=>false,
   :default_profile_image=>false,
   :following=>false,
   :follow_request_sent=>false,
   :notifications=>false},
   :geo=>{:type=>"Point",
   :coordinates=>[37.79235148, -122.40615138]},
   :coordinates=>{:type=>"Point",
   :coordinates=>[-122.40615138, 37.79235148]},
   :place=>{:id=>"e181b00c2f52bb2d",
   :url=>"https://api.twitter.com/1.1/geo/id/e181b00c2f52bb2d.json",
   :place_type=>"neighborhood",
   :name=>"Chinatown",
   :full_name=>"Chinatown, San Francisco",
   :country_code=>"US",
   :country=>"United States",
   :bounding_box=>{:type=>"Polygon",
   :coordinates=>[[[-122.41018188, 37.79022798], [-122.40392687999999, 37.79022798], [-122.40392687999999, 37.79798004], [-122.41018188, 37.79798004]]]},
   :attributes=>{}},
   :contributors=>nil,
   :retweet_count=>0,
   :favorite_count=>0,
   :entities=>{:hashtags=>[],
   :symbols=>[],
   :urls=>[{:url=>"http://t.co/pZ3aCXEgBH",
   :expanded_url=>"http://instagram.com/p/YRNWeKIRK2/",
   :display_url=>"instagram.com/p/YRNWeKIRK2/",
   :indices=>[71, 93]}],
   :user_mentions=>[]},
   :favorited=>false,
   :retweeted=>false,
   :possibly_sensitive=>false,
   :lang=>"en"}>
```
