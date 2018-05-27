require 'net/http'
require 'json'
require 'yaml'

api_key = YAML.load_file('api_keys.yml')['GIPHY']
puts "What would you like to search for ?"
input = gets.chomp

puts "Now searching for #{input}"
input.gsub!(" ", "+")
puts '--------------------------'
url = "http://api.giphy.com/v1/gifs/search?q=#{input}&api_key=#{api_key}&limit=5"
resp = Net::HTTP.get_response(URI.parse(url))
content = resp.body
result = JSON.parse(content)
giphys = result["data"]
puts "We have found these results"
giphys.first(3).each do |giphy|
  puts "- #{giphy["embed_url"]}"
end



