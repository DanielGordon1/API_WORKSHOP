require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "MudCp5XxK8aZTOJQHW1nmQczz"
  config.consumer_secret     = "uliRBW7Ih9R7gVKgod59z7Xp2ggazPpskuKWy5vS4bOiMazxII"
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
  sleep(3)
  array << tweet.text
end
