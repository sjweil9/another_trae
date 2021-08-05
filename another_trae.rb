require "bundler/inline"

gemfile do
  gem "twitter"
  gem "dotenv"
end

ID_FILE = './twitter_ids.txt'

File.open(ID_FILE) do |file|
  TWITTER_IDS = file.read.split(",").map(&:to_i)
end

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

client.user_timeline("TheTraeYoung").each do |tweet|
  next if TWITTER_IDS.include?(tweet.id)
  next unless tweet.text =~ /Another Day, Another Opportunity/

  client.retweet(tweet)
  client.favorite(tweet)
  TWITTER_IDS << tweet.id
end

File.open(ID_FILE, "wb+") do |file|
  file.write TWITTER_IDS.join(",")
end
