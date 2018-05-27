require 'twitter'
require 'yaml'

api_cons = YAML.load_file('api_keys.yml')['TWITTER_CONS']
api_secret = YAML.load_file('api_keys.yml')['TWITTER_SECRET']

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = api_cons
  config.consumer_secret     = api_secret
end

puts "ARE YOU READY? \n\n"

(0...10).each do |counter|
  puts "#{10 - counter} \n\n"
  sleep(1)
end

puts "GO! \n\n"

array = []

client.search("justinbieber marry me").take(300).collect do |tweet|
  designed_tweet = "#{tweet.user.screen_name}: #{tweet.text}"
  puts "#{designed_tweet} \n\n" unless ((array.include? tweet.text) || designed_tweet != designed_tweet.strip)
  sleep(1)
  array << tweet.text
end
